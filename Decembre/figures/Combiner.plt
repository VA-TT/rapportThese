# Array pour les couleurs - définition centralisée
array colors[9] = ["#9400d3", "#009e73", "#56b4e9", "#e69f00", "#f0e442", "#0072b2", "#e51e10", "#000000", "#808080"]

# Définition des linetypes avec couleurs personnalisées
set linetype  1 lc rgb "#9400d3" lw 1
set linetype  2 lc rgb "#009e73" lw 1
set linetype  3 lc rgb "#56b4e9" lw 1
set linetype  4 lc rgb "#e69f00" lw 1
set linetype  5 lc rgb "#f0e442" lw 1
set linetype  6 lc rgb "#0072b2" lw 1
set linetype  7 lc rgb "#e51e10" lw 1
set linetype  8 lc rgb "#000000" lw 1
set linetype  9 lc rgb "#808080" lw 1
set linetype cycle  9


################################## Contrainte Deviatorique - Deformation #####################################


reset
set autoscale
unset log
unset label

# Définir le terminal et le fichier de sortie
set term epslatex color colortext
set output './Test.tex'

# Configuration générale

# Paramètre centralisé pour le nombre de fichiers
numberFiles = 8
array files[numberFiles] = ["./I=1e-4/combined.dat", "./I=1e-3/combined.dat", "./I=1e-2/combined.dat", "./I=2e-2/combined.dat", "./I=4e-2/combined.dat", "./I=6e-2/combined.dat", "./I=8e-2/combined.dat", "./I=1e-1/combined.dat"]


# Arrays pour les données
array last_index[numberFiles]
array max_x[numberFiles]
array max_y[numberFiles]
array last_x[numberFiles]
array last_y[numberFiles]
array index_max_y[numberFiles]
array index_last[numberFiles]

# Array pour les titres des légendes
array titles[numberFiles] = ['$I = 10^{-4}$', '$I = 10^{-3}$', '$I = 10^{-2}$', '$I = 2 \times 10^{-2}$', '$I = 4 \times 10^{-2}$', '$I = 6 \times 10^{-2}$', '$I = 8 \times 10^{-2}$', '$I = 10^{-1}$']

# Boucle pour calculer les statistiques
# (và lưu lại index_max và index_last)
do for [i=1:numberFiles] {
    stats files[i] using \
        (($6*(-100) > 0 && $6*(-100) < 60) ? ($6*(-100)) : 1/0): \
        (($6*(-100) > 0 && $6*(-100) < 60) ? (($16-$12)/1000) : 1/0) name sprintf("data%d", i) nooutput
    last_index[i] = value(sprintf("data%d_records", i))
    max_y[i] = value(sprintf("data%d_max_y", i))
    index_max_y[i] = value(sprintf("data%d_index_max_y", i))
    index_last[i] = last_index[i]
}

# Boucle pour obtenir les coordonnées x des maxima
do for [i=1:numberFiles] {
    plot files[i] every ::(value(sprintf("data%d_index_max_y", i)))::(value(sprintf("data%d_index_max_y", i))) using ($6*(-100)):(($16-$12)/1000) w l
    max_x[i] = GPVAL_DATA_X_MAX
}

# Boucle pour obtenir les coordonnées des derniers points
do for [i=1:numberFiles] {
    plot files[i] every ::(last_index[i])::(last_index[i]) using ($6*(-100)):(($16-$12)/1000) with points pt 7 notitle
    last_x[i] = GPVAL_DATA_X_MAX
    last_y[i] = GPVAL_DATA_Y_MAX
}

# Print des résultats avec des boucles
do for [i=1:numberFiles] {
    print sprintf("Transitoire data%d: x = %.3f, y_max = %.3f", i, max_x[i], max_y[i])
}

print ""

do for [i=1:numberFiles] {
    print sprintf("Résiduel data%d: x = %.3f, y_last = %.3f", i, last_x[i], last_y[i])
}



# Effacer le graphique initial
set output
system("rm -f ./Test.tex ./Test.eps")

# Définir le style d'affichage
set output './1000KineticExt.tex'


# Définir la grille, la légende et les styles
set key below horizontal
set key font ",22"
set grid
set border linewidth 2

# Axes
set xlabel "$\\varepsilon_{yy}$ (\\%)"
set ylabel 'q (kPa)' offset 1,0
#set y2label '$\varepsilon_v$ (\%)'
set ytics
set ytics nomirror
#set y2tics
set xr [0:100]


# Styles de flèche
# set style arrow 1 head filled size screen 0.03,15,45 lw 2 lc rgb "black"
# set arrow from graph 0.3, graph 0.1 to graph 0.6, graph 0.9 as 1

# Array pour les titres des légendes (already defined earlier)
# set term wxt enhanced
plot for [i=1:numberFiles] files[i] using ($6*(-100)):(($16-$12)/(1000)) with lines lc i title titles[i]
     #for [i=1:numberFiles] files[i] using ($6*(-100)):(($2+$6+$10)*100) axes x1y2 with lines lc i notitle

reset
# Close the output file (optional)
set output



########################## Cercle Du Mohr Transitoire  #####################################
# reset
# set autoscale
# unset log
# unset label
# set border 0

# set term epslatex color colortext
# set output 'Transitoire.tex'

# # Input
# xmin = 0
# xmax = 140000
# ymin = 0
# ymax = 55000

# set arrow 1 from 0,0 to xmax,0 nohead
# set arrow 2 from 0,0 to 0,ymax nohead

# set xlabel "$\\sigma_n$ (kPa)"
# set ylabel "$\\tau$ (kPa)"
# set zeroaxis
# unset key
# unset grid

# set key below horizontal
# set key font ",18"

# Arrays pour les cercles de Mohr
# array sigma1_transitoire[numberFiles]
# array sigma3_transitoire[numberFiles]
# array radius_transitoire[numberFiles]
# array center_transitoire[numberFiles]
# array phi_transitoire[numberFiles]

# do for [i=1:numberFiles] {
#     # Lấy sigma1 (cột 16)
#     plot files[i] every ::(index_max_y[i]-1)::(index_max_y[i]-1) using 16 notitle
#     sigma1_transitoire[i] = GPVAL_DATA_Y_MIN

#     # Lấy sigma3 (cột 12)
#     plot files[i] every ::(index_max_y[i]-1)::(index_max_y[i]-1) using 12 notitle
#     sigma3_transitoire[i] = GPVAL_DATA_Y_MIN

#     radius_transitoire[i] = (sigma1_transitoire[i] - sigma3_transitoire[i]) / 2
#     center_transitoire[i] = (sigma1_transitoire[i] + sigma3_transitoire[i]) / 2
#     m_individuel[i] = tan(asin((sigma1_transitoire[i] - sigma3_transitoire[i]) / (sigma1_transitoire[i] + sigma3_transitoire[i])))
#     phi_transitoire[i] = atan(m_individuel[i]) * 180 / pi
#     print sprintf("Transitoire data%d: sigma1 = %.3f, sigma3 = %.3f, phi = %.2f°", i, sigma1_transitoire[i], sigma3_transitoire[i], phi_transitoire[i])
# }

# # # Effacer le graphique initial
# set output
# system("rm -f ./Transitoire.tex")

# # Définir le style d'affichage
# set output './Transitoire.tex'
# set xtics nomirror
# set ytics nomirror
# set xrange [xmin:xmax]
# set yrange [ymin:ymax]
# set size ratio -1

# # Array pour les couleurs
# # Note: colors array đã được định nghĩa ở đầu file

# # Créer les cercles et les tangentes
# do for [i=1:numberFiles] {
#     set object (i+10) circle at first center_transitoire[i], 0 size radius_transitoire[i] fillstyle empty border lc rgb colors[i]
# }

# set style arrow 1 head filled size screen 0.03,15,45 lw 2 lc rgb "black"
# set arrow from graph 0.4, graph 0.1 to graph 0.3, graph 0.9 as 1

# # Construction dynamique de la commande plot pour les tangentes
# plot for [i=1:numberFiles] tan(asin((sigma1_transitoire[i] - sigma3_transitoire[i])/(sigma1_transitoire[i] + sigma3_transitoire[i]))) * x with lines lc i title titles[i]

# # === Fit đường bao Mohr envelope cho transitoire ===
# # Tạo file tạm chứa (center, radius^2) cho transitoire
# set print 'mohr_transitoire_fit.dat'
# do for [i=1:numberFiles] {
#     print center_transitoire[i], radius_transitoire[i]**2
# }
# set print

# # Fit R^2 = A*C + B
# # f(x) = a*x + b
# # fit f(x) 'mohr_transitoire_fit.dat' using 1:2 via a,b

# # Vẽ đường bao Mohr envelope: y = sqrt(a*x + (a**2/4.0 + b))
# # mohr_envelope(x) = sqrt(a*x + (a**2/4.0 + b))

# # set style line 100 lt 1 lw 2 lc rgb 'red'
# # plot mohr_envelope(x) with lines ls 100 title 'Envelope fit'

# set output




########################## Cercle Du Mohr Résiduel#####################################
reset
set autoscale
unset log
unset label
set border 0

set term epslatex color colortext
set output 'Résiduel.tex'

# # Input
# xmin = 0
# xmax = 3000
# ymin = 0
# ymax = 7000

# set arrow 1 from 0,0 to xmax,0 nohead
# set arrow 2 from 0,0 to 0,ymax nohead

# set xlabel "$\\sigma_n$ (kPa)"
# set ylabel "$\\tau$ (kPa)"
# set zeroaxis
# unset key
# unset grid

# Arrays pour les données résiduelles
array sigma1_residuel[numberFiles]
array sigma3_residuel[numberFiles]
array radius_residuel[numberFiles]
array center_residuel[numberFiles]
array phi_residuel[numberFiles]
array m_individuel[numberFiles]



do for [i=1:numberFiles] {
    # Sử dụng stats để lấy giá trị sigma1 và sigma3 tại điểm cuối
    stats files[i] every ::(index_last[i])::(index_last[i]) using 16 nooutput
    sigma1_residuel[i] = STATS_min

    stats files[i] every ::(index_last[i])::(index_last[i]) using 12 nooutput
    sigma3_residuel[i] = STATS_min

    radius_residuel[i] = (sigma1_residuel[i] - sigma3_residuel[i]) / 2
    center_residuel[i] = (sigma1_residuel[i] + sigma3_residuel[i]) / 2
    m_individuel[i] = tan(asin((sigma1_residuel[i] - sigma3_residuel[i]) / (sigma1_residuel[i] + sigma3_residuel[i])))
    phi_residuel[i] = atan(m_individuel[i]) * 180 / pi
    print sprintf("Résiduel data%d: sigma1 = %.3f, sigma3 = %.3f, phi = %.2f°, m = %.5f", i, sigma1_residuel[i], sigma3_residuel[i], phi_residuel[i], m_individuel[i])
}

# # Effacer le graphique initial
# set output
system("rm -f ./Résiduel.tex ./Résiduel.eps")
# set output 'Résiduel.tex'
# set key below horizontal
# set key font ",18"

# set xtics nomirror
# set ytics nomirror
# set xrange [xmin:xmax]
# set yrange [ymin:ymax]
# set size ratio -1

# # Créer les cercles résiduels
# do for [i=1:numberFiles] {
#     set object (i+20) circle at first center_residuel[i], 0 size radius_residuel[i] fillstyle empty border lc rgb colors[i]
# }

# set style arrow 1 head filled size screen 0.03,15,45 lw 2 lc rgb "black"
# set arrow from graph 0.6, graph 0.1 to graph 0.5, graph 1 as 1

# # Construction dynamique de la commande plot pour les tangentes résiduelles
# plot for [i=1:numberFiles] tan(asin((sigma1_residuel[i] - sigma3_residuel[i])/(sigma1_residuel[i] + sigma3_residuel[i]))) * x with lines lc i title titles[i]

# # === Fit đường bao Mohr envelope cho résiduel ===
# set print 'mohr_residuel_fit.dat'
# do for [i=1:numberFiles] {
#     print center_residuel[i], radius_residuel[i]**2
# }
# set print

# # fit f(x) 'mohr_residuel_fit.dat' using 1:2 via a,b
# # mohr_envelope_res(x) = sqrt(a*x + (a**2/4.0 + b))

# # set style line 101 lt 1 lw 2 lc rgb 'blue'
# # plot mohr_envelope_res(x) with lines ls 101 title 'Envelope fit résiduel'

set output

quit



