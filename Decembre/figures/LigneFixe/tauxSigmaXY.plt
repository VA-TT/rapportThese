reset
set autoscale
unset log
set grid
set key box
set terminal epslatex color colortext
set output './mpmElas.tex'
set xlabel '$\sigma_{xx} / \sigma_{yy}$'
set ylabel 'h (m)'
set xr [0:1]
#set term wxt enhanced
plot \
'./v=0.1/data.dat' every 60::30::1170 using ($19/$22):($8-0.4) with linespoints lw 2 title '$\nu=0.1$',\
'./v=0.2/data.dat' every 60::30::1170 using ($19/$22):($8-0.4) with linespoints lw 2 title '$\nu=0.2$',\
'./v=0.3/data.dat' every 60::30::1170 using ($19/$22):($8-0.4) with linespoints lw 2 title '$\nu=0.3$',\
'./v=0.4/data.dat' every 60::30::1170 using ($19/$22):($8-0.4) with linespoints lw 2 title '$\nu=0.4$',\
'./v=0.49/data.dat' every 60::30::1170 using ($19/$22):($8-0.4) with linespoints lw 2 title '$\nu=0.49$'

set output
