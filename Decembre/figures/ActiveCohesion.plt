reset
set autoscale
unset log
unset label

# Axes labels and ranges
set border linewidth 3
set xlabel 'Déplacement du mur (mm)'
set ylabel '$F_a (kN)$' offset 0,0
set xrange [0:15]
set yrange [4.5:6]

# Style and output
unset grid
set key top right
set key noopaque nobox
set term epslatex color colortext
set output './ActiveCohesion.tex'

# Constant theoretical force (kN)
x0_mur = 3.4
Fcoh = 5.25
Fncoh = 5.38
# set term wxt enhanced
# Plot
plot \
	"./lent/Cohesif/actif/Force.txt" using (($2-x0_mur)*1000):(sqrt(($6)**2 + ($7)**2)/1000.0) with lines lw 2 lc 1 title "Simulation:$c=100Pa, v=0.005 m/s$," , \
	"./lent/NonCohesif/actif/Force.txt" using (($2-x0_mur)*1000):(sqrt(($6)**2 + ($7)**2)/1000.0) with lines lw 2 lc 2 title "Simulation:$c=0Pa, v=0.005 m/s$," , \
	Fcoh with lines lw 3 lc 1 dt 2 title "Théorie:$c = 100$", \
	Fncoh with lines lw 3 lc 2 dt 2 title "Théorie:$c = 0$"


# Close output
set output

