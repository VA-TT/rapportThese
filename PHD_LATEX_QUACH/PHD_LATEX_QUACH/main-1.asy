if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="main-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

size(8cm);

// Première boîte avec particules
path thebox = box((0,0), (1,1));
draw(thebox, blue + linewidth(2pt));
pair c1 = (0.1,0.2);
pair c2 = (0.9,0.8);
real R = 0.02;
label("$P1$", c1, 2S);
label("$P2$", c2, 2N);
path particule1 = circle(c1, R);
path particule2 = circle(c2, R);
fill(particule1, magenta);
fill(particule2, magenta);
draw(particule1, black + linewidth(1pt)); // Ajout du contour pour particule1
draw(particule2, black + linewidth(1pt)); // Ajout du contour pour particule2

// Deuxième boîte
draw(shift(1.0,0.0)*thebox, blue + linewidth(2pt));
fill(shift(1.0,0.0)*particule1, magenta);
fill(shift(1.0,0.0)*particule2, magenta);
draw(shift(1.0,0.0)*particule1, black + linewidth(1pt));
draw(shift(1.0,0.0)*particule2, black + linewidth(1pt));
label("$P'1$", c1 + (1,0), 2S);
label("$P'2$", c2 + (1,0), 2N);

//Sij
draw(c1 -- c2, arrow = Arrows(), L = "$s_{ij}$");
draw(c2 -- (c1 + (1,0)), arrow = Arrows(), L = "$s'_{ij}$");

