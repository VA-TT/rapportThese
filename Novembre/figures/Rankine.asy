settings.outformat = "pdf";
size(4cm,0);

real H = 1, L = 3;
path soil = box((0,0), (3,1));

filldraw(soil, cyan + linewidth(0.5pt));

real K = 0.4;
real Fmax = K * H;

real n = 10;
real dh = H/n;

pair p1 = (Fmax,0);

for (real r = 0; r < n; ++r)
{   
    draw((Fmax-K*dh*r, dh*r) -- (L,dh*r), arrow=Arrow(HookHead), black); 
}
draw ((L,H) -- p1);
