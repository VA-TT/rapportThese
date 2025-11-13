settings.outformat = "pdf";
size(6cm,0);
defaultpen(linewidth(0.5));

pen bleuFonce = rgb(0, 0, 0.8);
pen violet = rgb(0.8, 0, 0.8);
pen roseFonce = rgb(0.8, 0, 0.4);

pair X = (1,0);
pair Y = (0,1);


real H = 10, L = 30;
path soil = box((0,0), (L,H));

filldraw(soil, cyan);

real K = 0.7;
real Fmax = L - K * H;

real n = 5;
real dh = H/n;

pair p1 = (Fmax,0);

for (real r = 0; r < n; ++r)
{   
    draw((Fmax+K*dh*r, dh*r) -- (L,dh*r), arrow=Arrow(HookHead, size=1), black); 
}
draw ((L,H) -- p1);

pair p = (L, H*1/3); 
draw((p-10*X) -- p, arrow=Arrow(HookHead, size=5), purple);

label("$\vec{F_a} = S_{\Delta}$", (p-10*X), N);
real r = 0.5;
draw(((L,0)+r*Y) -- (L,H), bleuFonce + linewidth(1.5));
filldraw(circle((L,0)+r*Y, r), roseFonce+linewidth(1));

real hatchSpacing = 1;
    pen tangentcolor=gray;
    for(real x = 0; x <= L-1; x += hatchSpacing) {
        draw( (x, 0) -- (x - r , 0 - r), tangentcolor );
    }
        for(real y = 0; y <= H; y += hatchSpacing) {
        draw( (0, y) -- (0 - r , y - r), tangentcolor );
    }