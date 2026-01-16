reset
set autoscale
unset log
unset label
#set title ""
#set border linewidth 2
unset key
set grid
#set grid
set xlabel '$t \ (s)$'
set ylabel '$E_c \ (kg m^2/s^2)$' offset 0,0
set xr [0:0.1]
set yr [-0.5:3.5]
set term epslatex color colortext
set output './energieCinetique.tex'
#set style arrow 1 head filled size screen 0.03,15,45 lw 2 lc rgb "red"
#set arrow 1 from 0.5,50 to 1,500 as 1

plot "./Kinetic.txt" using ($1):($2) with lines

set output
