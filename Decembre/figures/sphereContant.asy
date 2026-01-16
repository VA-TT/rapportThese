import three;
import solids;


size(10cm);
currentprojection = perspective(5,3,2);

real R = 1;
triple C1 = (-0.6,0,0);
triple C2 = ( 0.6,0,0);

// Sphere surfaces (render normally)
draw(sphere(C1, R), surfacepen=opacity(0.3)+blue);
draw(sphere(C2, R), surfacepen=opacity(0.3)+red);

// --- Intersection Surface (lens region) ---
surface S_inter;

S_inter = surface(
    new triple(real u, real v) {
        triple P = C1 + R*unit(u,v);
        if (dot(P-C2, P-C2) <= R*R)
            return P;
        else
            return (nan,nan,nan); // skip point
    },
    0, 2pi, -pi/2, pi/2
);

// Draw the intersection region
draw(S_inter, surfacepen=opacity(0.8)+yellow);
