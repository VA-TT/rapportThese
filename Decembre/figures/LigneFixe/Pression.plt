reset
set autoscale
unset log
unset label

# Axes labels and ranges
set xlabel '$t \ (s)$'
set ylabel '$F_0 (kN)$' offset 0,0
set xrange [0:0.1]

# Style and output
set grid
set key bottom right
set term epslatex color colortext
set output './nonCohRepo.tex'

# Constant theoretical force (kN)
F = 7.647

# Plot
plot "./Force.txt" using 1:(sqrt(($6)**2 + ($7)**2)/1000.0) with lines lw 2 lc 1 title "Simulation", \
     F with lines lw 2 lc rgb "red" dt 2 title "Théorie"

# Close output
set output

