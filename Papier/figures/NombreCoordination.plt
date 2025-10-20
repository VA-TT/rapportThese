reset
set autoscale
unset log
unset label
set border linewidth 2
set key top right
set key width 0.6 height 1
set key font ",16"
set key box opaque
set grid
set xlabel '$\kappa$'
set ylabel 'Z' offset 0,0

set term epslatex color colortext
set output './NombreCoordination.tex'

plot \
    "./NombreCoordination.txt" using ($2):($3) smooth csplines with lines title '$N = 1000$', \
    "./NombreCoordination.txt" using ($2):($4) smooth csplines with lines title '$N = 3375$'

set output


