settings.outformat = "pdf";
size(6cm,0, keepAspect=true);
// unitsize(1cm); //else defalt is 1pt, which is too smalls
defaultpen(linewidth(0.5pt));

//Macro draw shifted
void drawshifted(path g, pair trueshift, picture pic =
currentpicture, Label label="", pen pen=currentpen,
arrowbar arrow=None, arrowbar bar=None, margin
margin=NoMargin, marker marker=nomarker)
{
pic.add(new void(frame f, transform t) {
picture opic;
draw(opic, L=label, shift(trueshift)*t*g, p=pen,
arrow=arrow, bar=bar,
margin=margin, marker=marker);
add(f,opic.fit());
});
pic.addBox(min(g), max(g), trueshift+min(pen),
trueshift+max(pen));
}

pen bleuFonce = rgb(0, 0, 0.8);
pen violet = rgb(0.8, 0, 0.8);
pen roseFonce = rgb(0.8, 0, 0.4);

real H = 10, L = 30;


real r = 0.5;
real wallWidth = 1.5;
margin reducedMargin = TrueMargin(wallWidth*0.5, wallWidth*0.5);

real hatchSpacing = 1;
    pen tangentcolor=gray;
    for(real x = 0; x <= L; x += hatchSpacing) {
        draw( (x, 0) -- (x - r , 0 - r), tangentcolor );
    }
        for(real y = 0; y <= H; y += hatchSpacing) {
        draw( (0, y) -- (0 - r , y - r), tangentcolor );
    }

path soil = box((0,0), (L,H));
filldraw(soil, lightcyan,linewidth(1.0));

real K = 1.42;
real Fmax = L - K * H;

real n = 5;
real dh = H/n;

pair p1 = (Fmax,0);

for (real r = 0; r < n; ++r)
{   
    draw((Fmax+K*dh*r, dh*r) -- (L,dh*r), arrow=Arrow(HookHead, size=2), black); 
}
draw ((L,H) -- p1);

pair p = (L, H*1/3); 
draw((p-20*E) -- p, arrow=Arrow(HookHead, size=5), purple);
pair wheelCenter = (L,0)+r*N;

label("$\vec{F_p}$", (p-20*E), N);

draw(wheelCenter -- (L,H), bleuFonce + linewidth(wallWidth), margin = reducedMargin);
filldraw(circle(wheelCenter, r), roseFonce, linewidth(0.75));

pair vectorV = wheelCenter-r*5E;
draw(vectorV -- wheelCenter, arrow=Arrow(HookHead, size=2), purple);
label("$\vec{v_p}$", vectorV, 0.25*N);


//Dim
pair dimShiftX = (-0.5cm, 0);
pair dimShiftY = (0, -0.75cm);
Label barLengthH = Label("$L$", align=N, position=MidPoint, filltype=Fill(white));
Label barLengthV = Label("$H$", align=W, position=MidPoint, filltype=Fill(white));
drawshifted((0,0) -- (L,0), trueshift=dimShiftY, label=barLengthH, arrow=Arrows(size=8), bar=Bars);
drawshifted((0,0) -- (0,H), trueshift=dimShiftX, label=barLengthV, arrow=Arrows(size=8), bar=Bars);
