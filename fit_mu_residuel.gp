### Biểu đồ mu(I) ###
reset
set encoding utf8
set terminal epslatex color colortext
set output './mu_I_fit.tex'

set xlabel "$I$"
set ylabel "$\\mu$"
set grid
set key box opaque top left

set logscale x 10
set xrange [1e-4:1e-1]
set xtics ("$10^{-4}$" 1e-4, "$10^{-3}$" 1e-3, "$10^{-2}$" 1e-2, "$10^{-1}$" 1e-1)

mu(x) = mus + (mu2 - mus)/(1 + I0/x)

mus = 0.334218735812687
mu2 = 0.43
I0 = 0.1

fit mu(x) 'Mu(I)_Rheology.dat' using 1:4 via mus, mu2, I0

set label 1 sprintf("$\\mu_s = %.4f$", mus) at graph 0.1, 0.8
set label 2 sprintf("$\\mu_2 = %.4f$", mu2) at graph 0.1, 0.7
set label 3 sprintf("$I_0 = %.4f$", I0) at graph 0.1, 0.6

plot 'Mu(I)_Rheology.dat' using 1:4 with points pt 7 ps 1.5 title "Données", \
     mu(x) with lines lw 2 lc rgb "red" title "$\\mu(I)$ régression"
set output

### Biểu đồ phi(I) ###
reset
set encoding utf8
set terminal epslatex color colortext
set output './Pack_I_fit.tex'
set xlabel "$I$"
set ylabel "$\\Phi$"
set grid
set key bottom left box opaque
set logscale x 10
set xrange [1e-4:1e-1]
set xtics ("$10^{-4}$" 1e-4, "$10^{-3}$" 1e-3, "$10^{-2}$" 1e-2, "$10^{-1}$" 1e-1)

phi(x) = phimax - b * x
phimax = 0.64
b = 1.0

fit phi(x) 'Mu(I)_Rheology.dat' using 1:(1.0/(1.0 + $2)) via phimax, b

set label 1 sprintf("$\\Phi_{max} = %.4f$", phimax) at graph 0.1, 0.25
set label 2 sprintf("$b = %.4f$", b) at graph 0.1, 0.15

plot 'Mu(I)_Rheology.dat' using 1:(1.0/(1.0 + column(2))) with points pt 7 ps 1.5 title "Données", \
     phi(x) with lines lw 2 lc rgb "red" title "$\\Phi(I)$ régression"
set output


### Biểu đồ mu(Q) ###
reset
set encoding utf8
set terminal epslatex color colortext
set output './Q_mu.tex'
set xlabel "$Q$"
set ylabel "$\\mu$"
set grid
set key top left box opaque

mu(x) = xi * (phimax * (log(x) + alpha)) + c
alpha = 30
xi = 0.06
c = 0.2
phimax = phimax

fit mu(x) 'Mu(I)_Rheology.dat' using 1:5 via xi, phimax, c

muQ(Q) = xi * Q + c

set label 1 sprintf("$\\xi = %.4f$", xi) at graph 0.1, 0.8
set label 2 sprintf("$c = %.4f$", c) at graph 0.1, 0.7
set label 3 sprintf("$\\Phi_0 = %.4f$", phimax) at graph 0.1, 0.6

plot [10.5:13.5] 'Mu(I)_Rheology.dat' using (phimax * (log(column(1))+30)):(column(5)) with points pt 7 ps 1.5 title "Données", \
     muQ(x) with lines lw 2 lc rgb "red" title "$\\mu(Q)$ régression"
set output


### Biểu đồ σ₁(I) ###
reset
set encoding utf8
set terminal epslatex color colortext
set output './sigma_I_plot.tex'

set xlabel "$I$"
set ylabel '$\sigma_1$ (kPa)'
set grid
set key box opaque top left

set logscale x 10
set xrange [1e-4:0.1]
set xtics ("$10^{-4}$" 1e-4, "$10^{-3}$" 1e-3, "$10^{-2}$" 1e-2, "$10^{-1}$" 1e-1)

plot 'Mu(I)_Rheology.dat' using 1:6 with points pt 7 ps 1 lc rgb "blue" notitle, \
     'Mu(I)_Rheology.dat' using 1:6 smooth csplines lw 2 lc rgb "blue" title "pic", \
     'Mu(I)_Rheology.dat' using 1:7 with points pt 5 ps 1 lc rgb "red" notitle, \
     'Mu(I)_Rheology.dat' using 1:7 smooth csplines lw 2 lc rgb "red" title "état critique"


set output
