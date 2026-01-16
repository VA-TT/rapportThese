reset
set autoscale
unset log
set grid

set term wxt enhanced
set xlabel '$\sigma_{yy}$'
set ylabel 'h (m)'
plot 'data0.dat' every ::0::60 using ($22) with linespoints lw 2 notitle,\
'data1.dat' every ::0::60 using ($22) with linespoints lw 2 notitle

set output
