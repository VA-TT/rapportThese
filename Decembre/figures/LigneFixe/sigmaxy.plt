reset
set autoscale
unset log
set key box top right
set grid
# set term wxt enhanced
set terminal epslatex color colortext
set output './bandeMilieu.tex'
set xlabel '$\sigma$ (kPa)'
set ylabel 'h (m)'


conv = -1.0/1000.0
set term wxt enhanced
plot 'data.dat' every 60::30::1170 using ($19*conv):($8-0.4) with linespoints lw 2 lc rgb "red" title '$\sigma_{xx}$', \
     'data.dat' every 60::30::1170 using ($22*conv):($8-0.4) with linespoints lw 2 lc rgb "blue" title '$\sigma_{yy}$'

set output
