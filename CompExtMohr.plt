# Array pour les couleurs - définition centralisée
array colors[12] = ["#9400d3", "#009e73", "#56b4e9", "#e69f00", "#f0e442", "#0072b2", "#e51e10", "#000000", "#808080","#aa00ff","#000080","#d80073"]

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
set linetype  10 lc rgb "#aa00ff" lw 1
set linetype  11 lc rgb "#000080" lw 1
set linetype  12 lc rgb "#d80073" lw 1
set linetype cycle  12

reset
set autoscale
unset log
unset label
set border 0

set term epslatex color colortext
set output './Cercle_1000_residuel.tex'

# Input
xmin = 0
xmax = 90
ymin = -30
ymax = 30

# set arrow 1 from 0,0 to xmax,0 nohead
# set arrow 2 from 0,0 to 0,ymax nohead

set xlabel "$\\sigma_n$ (kPa)"
set ylabel "$\\tau$ (kPa)"
unset border
set xtics (" " 0, 20, 40, 60, 80, 100) axis nomirror offset 0, -0.2
set ytics axis nomirror
set arrow from 0,ymin to 0,ymax nohead
set arrow from xmin,0 to xmax,0 nohead
set key bottom left
unset grid

# Input
sigma1_1 = 63.2658
sigma3_1 = 30
sigma1_2 = 30
sigma3_2 = 15.0127

sigma1_3 = 61.3891
sigma3_3 = 30
sigma1_4 = 30
sigma3_4 = 14.527

sigma1_5 = 81.6339
sigma3_5 = 30
sigma1_6 = 30
sigma3_6 = 11.6382

delta_x = -30
delta_y = -30

# Rayons des cercles
radius_1 = (sigma1_1 - sigma3_1) / 2
radius_2 = (sigma1_2 - sigma3_2) / 2
radius_3 = (sigma1_3 - sigma3_3) / 2
radius_4 = (sigma1_4 - sigma3_4) / 2
radius_5 = (sigma1_5 - sigma3_5) / 2
radius_6 = (sigma1_6 - sigma3_6) / 2

# Center des cercles
center_1 = (sigma1_1 + sigma3_1) / 2
center_2 = (sigma1_2 + sigma3_2) / 2
center_3 = (sigma1_3 + sigma3_3) / 2
center_4 = (sigma1_4 + sigma3_4) / 2
center_5 = (sigma1_5 + sigma3_5) / 2
center_6 = (sigma1_6 + sigma3_6) / 2

# Set range
set xrange [xmin:xmax]
set yrange [ymin:ymax]
set size ratio -1  # xaxis ratio = yaxis ratio 

# Set parameters
m1 = tan(asin((sigma1_1 - sigma3_1) / (sigma1_1 + sigma3_1)))
m2 = tan(asin((sigma1_2 - sigma3_2) / (sigma1_2 + sigma3_2)))
m3 = tan(asin((sigma1_3 - sigma3_3) / (sigma1_3 + sigma3_3)))
m4 = tan(asin((sigma1_4 - sigma3_4) / (sigma1_4 + sigma3_4)))
m5 = tan(asin((sigma1_5 - sigma3_5) / (sigma1_5 + sigma3_5)))
m6 = tan(asin((sigma1_6 - sigma3_6) / (sigma1_6 + sigma3_6)))

phi1 = atan(m1) * 180 / pi
phi2 = atan(m2) * 180 / pi
phi3 = atan(m3) * 180 / pi
phi4 = atan(m4) * 180 / pi
phi5 = atan(m5) * 180 / pi
phi6 = atan(m6) * 180 / pi

y_tangent1(x) = m1 * x + 0
y_tangent2(x) = m2 * x + 0
y_tangent3(x) = m3 * x + 0
y_tangent4(x) = m4 * x + 0
y_tangent5(x) = m5 * x + 0
y_tangent6(x) = m6 * x + 0

m_common1 = tan(asin(abs(radius_1 - radius_2)/abs(center_1 - center_2)))
m_common2 = tan(asin(abs(radius_3 - radius_4)/abs(center_3 - center_4)))
m_common3 = tan(asin(abs(radius_5 - radius_6)/abs(center_5 - center_6)))

phi_common_degree1 = atan(m_common1) * 180 / pi
phi_common_radius1 = phi_common_degree1 / 180 * pi
phi_common_degree2 = atan(m_common2) * 180 / pi
phi_common_radius2 = phi_common_degree2 / 180 * pi
phi_common_degree3 = atan(m_common3) * 180 / pi
phi_common_radius3 = phi_common_degree3 / 180 * pi

c_common1 = radius_1 * 1/abs(cos(phi_common_radius1)) - tan(phi_common_radius1) * center_1
c_common2 = radius_3 * 1/abs(cos(phi_common_radius2)) - tan(phi_common_radius2) * center_3
c_common3 = radius_5 * 1/abs(cos(phi_common_radius3)) - tan(phi_common_radius3) * center_5

# print "phi1 = ",phi1,  ", phi2 = ", phi2, phi_MohrCoulomb = ", phi_common_degree, ", c_MohrCoulomb = ", c_common

delx = 1
#y_tangent1(x) = m1 * x + 0
#y_tangent2(x) = m2 * x + 0
#y_tangent3(x) = m3 * x + 0
y_tangent_common1(x) = m_common1 * x + c_common1
y_tangent_common2(x) = m_common2 * x + c_common2
y_tangent_common3(x) = m_common3 * x + c_common3



set object 1 circle at first center_1, 0 size radius_1 fillstyle transparent border lc rgb "#aa00ff"
set object 2 circle at first center_2, 0 size radius_2 fillstyle transparent border lc rgb "#aa00ff"
set object 3 circle at first center_3, 0 size radius_3 fillstyle transparent border lc rgb "#000080"
set object 4 circle at first center_4, 0 size radius_4 fillstyle transparent border lc rgb "#000080"
set object 5 circle at first center_5, 0 size radius_5 fillstyle transparent border lc rgb "#d80073"
set object 6 circle at first center_6, 0 size radius_6 fillstyle transparent border lc rgb "#d80073"

#set arrow from 0,c_common1 to radius_1, c_common1 nohead lc rgb "#aa00ff"
#set object circle at first 0,c_common1 size (sigma3_2)/2 arc [0:phi_common_degree1] fillstyle empty border lc rgb "#aa00ff"
#set label sprintf("$\\varphi_1 = %.2f^\\circ$", phi_common_degree1) at (sigma3_2)/2 + delx, c_common1+((sigma3_2)/2 + delx)*atan(m_common1)/2 textcolor rgb "#aa00ff"
# set label sprintf("c = %.2f", c_common) at 0 + delx, c_common-delx textcolor rgb "#aa00ff"
# set label sprintf("$c_1 = %.2f$",c_common1) at 0 + delx, c_common1-delx textcolor rgb "#aa00ff"
# set label sprintf("$c_2 = %.2f$",c_common2) at 0 + delx, c_common2+delx textcolor rgb "#000080"
# set label sprintf("$c_3 = %.2f$",c_common3) at 0 + delx, c_common3-0.5*delx textcolor rgb "#d80073"

# set label sprintf("$\\rotatebox{%d}{\\varphi_1 = %.2f^\\circ}$", phi_common_degree1, phi_common_degree1) at graph 0.5, graph 0.5*m_common1 center textcolor rgb "#aa00ff"
# set label sprintf("$\\rotatebox{%d}{\\varphi_2 = %.2f^\\circ}$", phi_common_degree2, phi_common_degree2) at graph 0.5, graph 0.5*m_common2 center textcolor rgb "#000080"
# set label sprintf("$\\rotatebox{%d}{\\varphi_3 = %.2f^\\circ}$", phi_common_degree3, phi_common_degree3) at graph 0.5, graph 0.5*m_common3 center textcolor rgb "#d80073"

# Tracer le graphique des droites
plot y_tangent_common1(x) with lines lc rgb "#aa00ff" title sprintf('$I = 10^{-3}: \varphi = %.2f^{\circ}, c = %.2f$ kPa', phi_common_degree1, c_common1),\
     y_tangent_common2(x) with lines lc rgb "#000080" title sprintf('$I = 10^{-2}: \varphi = %.2f^{\circ}, c = %.2f$ kPa', phi_common_degree2, c_common2),\
     y_tangent_common3(x) with lines lc rgb "#d80073" title sprintf('$I = 10^{-1}: \varphi = %.2f^{\circ}, c = %.2f$ kPa', phi_common_degree3, c_common3)

set output
