reset
set autoscale
unset log
unset label
#set title ""
#set border linewidth 2
unset key
set grid
#set grid
set xlabel '$t$ (s)'
set ylabel '$F_0$(kPa)' offset 0,0
# set xr [0:0.1]
# set yr [-0.5:3.5]
set term epslatex color colortext
set output './ForceFond.tex'
#set style arrow 1 head filled size screen 0.03,15,45 lw 2 lc rgb "red"
#set arrow 1 from 0.5,50 to 1,500 as 1
set term wxt enhanced

# Option A: đặt trục x theo log (base 10)
set logscale x
set xlabel 't (log scale)'
F = 79.461
plot "./Force1.txt" using ($1):($7)/1000 with lines, \
     F with lines lw 2 lc rgb "red" dt 2 title "Théorie"

set output
