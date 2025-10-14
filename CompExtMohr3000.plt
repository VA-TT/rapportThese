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

set term epslatex color colortext size 16cm,16cm
set output './Cercle_3000_residuel.tex'

# Input
xmin = 0
xmax = 100
ymin = -40
ymax = 40

# set arrow 1 from 0,0 to xmax,0 nohead
# set arrow 2 from 0,0 to 0,ymax nohead

set xlabel "$\\sigma_n$ (kPa)" offset 28,15
set ylabel "$\\tau$ (kPa)"
unset border
set xtics (" " 0, 20, 40, 60, 80, 100) axis nomirror 
set ytics axis nomirror
set arrow from 0,ymin to 0,ymax nohead
set arrow from xmin,0 to xmax,0 nohead
set key bottom left
unset grid

# Input

#A couple of sigma to draw the Mohr Circle <60%
sigma1_1 = 59.175 #Compression residuel
sigma3_1 = 30  #Same sigma3 for compression
sigma1_2 = 30  #Same sigma3 for Extension
sigma3_2 = 15.149 #Extension residuel

#Another couple
sigma1_3 = 62.128
sigma3_3 = 30
sigma1_4 = 30
sigma3_4 = 14.596

sigma1_5 = 84.764
sigma3_5 = 30
sigma1_6 = 30
sigma3_6 = 12.212

# sigma1_7 = 65.3422
# sigma3_7 = 30
# sigma1_8 = 30
# sigma3_8 = 13.5798

# sigma1_9 = 75.4962
# sigma3_9 = 30
# sigma1_10 = 30
# sigma3_10 = 15.9787

# sigma1_11 = 78.7271
# sigma3_11 = 30
# sigma1_12 = 30
# sigma3_12 = 12.5371

# sigma1_13 = 87.3058
# sigma3_13 = 30
# sigma1_14 = 30
# sigma3_14 = 13.6441

# sigma1_15 = 96.2418
# sigma3_15 = 30
# sigma1_16 = 30
# sigma3_16 = 13.2913

# #Another couple <30%
# sigma1_1 = 65.7959  #Compression residuel
# sigma3_1 = 30  #Same sigma3 for compression
# sigma1_2 = 30  #Same sigma3 for Extension
# sigma3_2 = 14.6044 #Extension residuel

# sigma1_3 = 63.2658
# sigma3_3 = 30
# sigma1_4 = 30
# sigma3_4 = 15.2852

# sigma1_5 = 61.3891
# sigma3_5 = 30
# sigma1_6 = 30
# sigma3_6 = 14.7711

# sigma1_7 = 59.979
# sigma3_7 = 30
# sigma1_8 = 30
# sigma3_8 = 14.3254

# sigma1_9 = 72.3845
# sigma3_9 = 30
# sigma1_10 = 30
# sigma3_10 = 13.5763

# sigma1_11 = 70.9943
# sigma3_11 = 30
# sigma1_12 = 30
# sigma3_12 = 13.1244

# sigma1_13 = 70.8903
# sigma3_13 = 30
# sigma1_14 = 30
# sigma3_14 = 11.5727

# sigma1_15 = 81.6339
# sigma3_15 = 30
# sigma1_16 = 30
# sigma3_16 = 11.7319

delta_x = -30
delta_y = -30

# Rayons des cercles
radius_1 = (sigma1_1 - sigma3_1) / 2
radius_2 = (sigma1_2 - sigma3_2) / 2
radius_3 = (sigma1_3 - sigma3_3) / 2
radius_4 = (sigma1_4 - sigma3_4) / 2
radius_5 = (sigma1_5 - sigma3_5) / 2
radius_6 = (sigma1_6 - sigma3_6) / 2
# radius_7 = (sigma1_7 - sigma3_7) / 2
# radius_8 = (sigma1_8 - sigma3_8) / 2
# radius_9 = (sigma1_9 - sigma3_9) / 2
# radius_10 = (sigma1_10 - sigma3_10) / 2
# radius_11 = (sigma1_11 - sigma3_11) / 2
# radius_12 = (sigma1_12 - sigma3_12) / 2
# radius_13 = (sigma1_13 - sigma3_13) / 2
# radius_14 = (sigma1_14 - sigma3_14) / 2
# radius_15 = (sigma1_15 - sigma3_15) / 2
# radius_16 = (sigma1_16 - sigma3_16) / 2

# Center des cercles
center_1 = (sigma1_1 + sigma3_1) / 2
center_2 = (sigma1_2 + sigma3_2) / 2
center_3 = (sigma1_3 + sigma3_3) / 2
center_4 = (sigma1_4 + sigma3_4) / 2
center_5 = (sigma1_5 + sigma3_5) / 2
center_6 = (sigma1_6 + sigma3_6) / 2
# center_7 = (sigma1_7 + sigma3_7) / 2
# center_8 = (sigma1_8 + sigma3_8) / 2
# center_9 = (sigma1_9 + sigma3_9) / 2
# center_10 = (sigma1_10 + sigma3_10) / 2
# center_11 = (sigma1_11 + sigma3_11) / 2
# center_12 = (sigma1_12 + sigma3_12) / 2
# center_13 = (sigma1_13 + sigma3_13) / 2
# center_14 = (sigma1_14 + sigma3_14) / 2
# center_15 = (sigma1_15 + sigma3_15) / 2
# center_16 = (sigma1_16 + sigma3_16) / 2

# Set range
set xrange [xmin:xmax]
set yrange [ymin:ymax]
set size ratio -1  # xaxis ratio = yaxis ratio 

# Set parameters
m1 = tan(asin((sigma1_1 - sigma3_1) / (sigma1_1 + sigma3_1)))
m2 = tan(asin((sigma1_2 - sigma3_2) / (sigma1_2 + sigma3_2)))
m3 = tan(asin((sigma1_3 - sigma3_3) / (sigma1_3 + sigma3_3)))
# m4 = tan(asin((sigma1_4 - sigma3_4) / (sigma1_4 + sigma3_4)))
# m5 = tan(asin((sigma1_5 - sigma3_5) / (sigma1_5 + sigma3_5)))
# m6 = tan(asin((sigma1_6 - sigma3_6) / (sigma1_6 + sigma3_6)))
# m7 = tan(asin((sigma1_7 - sigma3_7) / (sigma1_7 + sigma3_7)))
# m8 = tan(asin((sigma1_8 - sigma3_8) / (sigma1_8 + sigma3_8)))
# m9 = tan(asin((sigma1_9 - sigma3_9) / (sigma1_9 + sigma3_9)))
# m10 = tan(asin((sigma1_10 - sigma3_10) / (sigma1_10 + sigma3_10)))
# m11 = tan(asin((sigma1_11 - sigma3_11) / (sigma1_11 + sigma3_11)))
# m12 = tan(asin((sigma1_12 - sigma3_12) / (sigma1_12 + sigma3_12)))
# m13 = tan(asin((sigma1_13 - sigma3_13) / (sigma1_13 + sigma3_13)))
# m14 = tan(asin((sigma1_14 - sigma3_14) / (sigma1_14 + sigma3_14)))
# m15 = tan(asin((sigma1_15 - sigma3_15) / (sigma1_15 + sigma3_15)))
# m16 = tan(asin((sigma1_16 - sigma3_16) / (sigma1_16 + sigma3_16)))


phi1 = atan(m1) * 180 / pi
phi2 = atan(m2) * 180 / pi
phi3 = atan(m3) * 180 / pi
# phi4 = atan(m4) * 180 / pi
# phi5 = atan(m5) * 180 / pi
# phi6 = atan(m6) * 180 / pi
# phi7 = atan(m7) * 180 / pi
# phi8 = atan(m8) * 180 / pi
# phi9 = atan(m9) * 180 / pi
# phi10 = atan(m10) * 180 / pi
# phi11 = atan(m11) * 180 / pi
# phi12 = atan(m12) * 180 / pi
# phi13 = atan(m13) * 180 / pi
# phi14 = atan(m14) * 180 / pi
# phi15 = atan(m15) * 180 / pi
# phi16 = atan(m16) * 180 / pi


y_tangent1(x) = m1 * x + 0
y_tangent2(x) = m2 * x + 0
y_tangent3(x) = m3 * x + 0
# y_tangent4(x) = m4 * x + 0
# y_tangent5(x) = m5 * x + 0
# y_tangent6(x) = m6 * x + 0
# y_tangent7(x) = m7 * x + 0
# y_tangent8(x) = m8 * x + 0
# y_tangent9(x) = m9 * x + 0
# y_tangent10(x) = m10 * x + 0
# y_tangent11(x) = m11 * x + 0
# y_tangent12(x) = m12 * x + 0
# y_tangent13(x) = m13 * x + 0
# y_tangent14(x) = m14 * x + 0
# y_tangent15(x) = m15 * x + 0
# y_tangent16(x) = m16 * x + 0


m_common1 = tan(asin(abs(radius_1 - radius_2)/abs(center_1 - center_2)))
m_common2 = tan(asin(abs(radius_3 - radius_4)/abs(center_3 - center_4)))
m_common3 = tan(asin(abs(radius_5 - radius_6)/abs(center_5 - center_6)))
# m_common4 = tan(asin(abs(radius_7 - radius_8)/abs(center_7 - center_8)))
# m_common5 = tan(asin(abs(radius_9 - radius_10)/abs(center_9 - center_10)))
# m_common6 = tan(asin(abs(radius_11 - radius_12)/abs(center_11 - center_12)))
# m_common7 = tan(asin(abs(radius_13 - radius_14)/abs(center_13 - center_14)))
# m_common8 = tan(asin(abs(radius_15 - radius_16)/abs(center_15 - center_16)))

# Print m_common values for debugging
print sprintf('m_common1 = %.8f', m_common1)
print sprintf('m_common2 = %.8f', m_common2)
print sprintf('m_common3 = %.8f', m_common3)
# print sprintf('m_common4 = %.8f', m_common4)
# print sprintf('m_common5 = %.8f', m_common5)
# print sprintf('m_common6 = %.8f', m_common6)
# print sprintf('m_common7 = %.8f', m_common7)
# print sprintf('m_common8 = %.8f', m_common8)

phi_common_degree1 = atan(m_common1) * 180 / pi
phi_common_radius1 = phi_common_degree1 / 180 * pi
phi_common_degree2 = atan(m_common2) * 180 / pi
phi_common_radius2 = phi_common_degree2 / 180 * pi
phi_common_degree3 = atan(m_common3) * 180 / pi
phi_common_radius3 = phi_common_degree3 / 180 * pi
# phi_common_degree4 = atan(m_common4) * 180 / pi
# phi_common_radius4 = phi_common_degree4 / 180 * pi
# phi_common_degree5 = atan(m_common5) * 180 / pi
# phi_common_radius5 = phi_common_degree5 / 180 * pi
# phi_common_degree6 = atan(m_common6) * 180 / pi
# phi_common_radius6 = phi_common_degree6 / 180 * pi
# phi_common_degree7 = atan(m_common7) * 180 / pi
# phi_common_radius7 = phi_common_degree7 / 180 * pi
# phi_common_degree8 = atan(m_common8) * 180 / pi
# phi_common_radius8 = phi_common_degree8 / 180 * pi

c_common1 = radius_1 * 1/abs(cos(phi_common_radius1)) - tan(phi_common_radius1) * center_1
c_common2 = radius_3 * 1/abs(cos(phi_common_radius2)) - tan(phi_common_radius2) * center_3
c_common3 = radius_5 * 1/abs(cos(phi_common_radius3)) - tan(phi_common_radius3) * center_5
# c_common4 = radius_7 * 1/abs(cos(phi_common_radius4)) - tan(phi_common_radius4) * center_7
# c_common5 = radius_9 * 1/abs(cos(phi_common_radius5)) - tan(phi_common_radius5) * center_9
# c_common6 = radius_11 * 1/abs(cos(phi_common_radius6)) - tan(phi_common_radius6) * center_11
# c_common7 = radius_13 * 1/abs(cos(phi_common_radius7)) - tan(phi_common_radius7) * center_13
# c_common8 = radius_15 * 1/abs(cos(phi_common_radius8)) - tan(phi_common_radius8) * center_15


# print "phi1 = ",phi1,  ", phi2 = ", phi2, phi_MohrCoulomb = ", phi_common_degree, ", c_MohrCoulomb = ", c_common

delx = 1
#y_tangent1(x) = m1 * x + 0
#y_tangent2(x) = m2 * x + 0
#y_tangent3(x) = m3 * x + 0
y_tangent_common1(x) = m_common1 * x + c_common1
y_tangent_common2(x) = m_common2 * x + c_common2
y_tangent_common3(x) = m_common3 * x + c_common3
# y_tangent_common4(x) = m_common4 * x + c_common4
# y_tangent_common5(x) = m_common5 * x + c_common5
# y_tangent_common6(x) = m_common6 * x + c_common6
# y_tangent_common7(x) = m_common7 * x + c_common7
# y_tangent_common8(x) = m_common8 * x + c_common8



set object 1 circle at first center_1, 0 size radius_1 arc [0:180] fillstyle transparent border lc rgb colors[1]
set object 2 circle at first center_2, 0 size radius_2 arc [0:180] fillstyle transparent border lc rgb colors[1]
set object 3 circle at first center_3, 0 size radius_3 arc [0:180] fillstyle transparent border lc rgb colors[2]
set object 4 circle at first center_4, 0 size radius_4 arc [0:180] fillstyle transparent border lc rgb colors[2]
set object 5 circle at first center_5, 0 size radius_5 arc [0:180] fillstyle transparent border lc rgb colors[3]
set object 6 circle at first center_6, 0 size radius_6 arc [0:180] fillstyle transparent border lc rgb colors[3]
# set object 7 circle at first center_7, 0 size radius_7 arc [0:180] fillstyle transparent border lc rgb colors[4]
# set object 8 circle at first center_8, 0 size radius_8 arc [0:180] fillstyle transparent border lc rgb colors[4]
# set object 9 circle at first center_9, 0 size radius_9 arc [0:180] fillstyle transparent border lc rgb colors[5]
# set object 10 circle at first center_10, 0 size radius_10 arc [0:180] fillstyle transparent border lc rgb colors[5]
# set object 11 circle at first center_11, 0 size radius_11 arc [0:180] fillstyle transparent border lc rgb colors[6]
# set object 12 circle at first center_12, 0 size radius_12 arc [0:180] fillstyle transparent border lc rgb colors[6]
# set object 13 circle at first center_13, 0 size radius_13 arc [0:180] fillstyle transparent border lc rgb colors[7]
# set object 14 circle at first center_14, 0 size radius_14 arc [0:180] fillstyle transparent border lc rgb colors[7]
# set object 15 circle at first center_15, 0 size radius_15 arc [0:180] fillstyle transparent border lc rgb colors[8]
# set object 16 circle at first center_16, 0 size radius_16 arc [0:180] fillstyle transparent border lc rgb colors[8]


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
# set term wxt enhanced
plot y_tangent_common1(x) with lines lc rgb colors[1] title sprintf('$I = 10^{-3}: \varphi = %.2f^{\circ}, c = %.2f$ kPa', phi_common_degree1, c_common1),\
     y_tangent_common2(x) with lines lc rgb colors[2] title sprintf('$I = 10^{-2}: \varphi = %.2f^{\circ}, c = %.2f$ kPa', phi_common_degree2, c_common2),\
     y_tangent_common3(x) with lines lc rgb colors[3] title sprintf('$I = 10^{-1}: \varphi = %.2f^{\circ}, c = %.2f$ kPa', phi_common_degree3, c_common3)
    #  ,\
    #  y_tangent_common4(x) with lines lc rgb colors[4] title sprintf('$I = 2 \times 10^{-2}: \varphi = %.2f^{\circ}, c = %.2f$ kPa', phi_common_degree4, c_common4),\
    #  y_tangent_common5(x) with lines lc rgb colors[5] title sprintf('$I = 4 \times 10^{-2}: \varphi = %.2f^{\circ}, c = %.2f$ kPa', phi_common_degree5, c_common5),\
    #  y_tangent_common6(x) with lines lc rgb colors[6] title sprintf('$I = 6 \times 10^{-2}: \varphi = %.2f^{\circ}, c = %.2f$ kPa', phi_common_degree6, c_common6),\
    #  y_tangent_common7(x) with lines lc rgb colors[7] title sprintf('$I = 8 \times 10^{-2}: \varphi = %.2f^{\circ}, c = %.2f$ kPa', phi_common_degree7, c_common7),\
    #  y_tangent_common8(x) with lines lc rgb colors[8] title sprintf('$I = 10^{-1}: \varphi = %.2f^{\circ}, c = %.2f$ kPa', phi_common_degree8, c_common8)

set output


### Biểu đồ mu(I) ###
reset
set encoding utf8
set terminal epslatex color colortext
set output './mu_I_3000.tex'

set xlabel "$I$"
set ylabel "$\\mu$"
set grid
set key box opaque top left

set logscale x 10


mu(x) = mus + (mu2 - mus)/(1 + I0/x)

# Build I and mu arrays from the computed m_common values (no external data file needed)
array Ivals[3] = [1e-3, 1e-2, 1e-1]
array muvals[3]
muvals[1] = m_common1
muvals[2] = m_common2
muvals[3] = m_common3
# muvals[4] = m_common4
# muvals[5] = m_common5
# muvals[6] = m_common6
# muvals[7] = m_common7
# muvals[8] = m_common8

# Titles for xtics (user requested strings)
array titles[3] = ["$I = 10^{-3}$", "$I = 10^{-2}$", "$I = 10^{-1}$"]

set xtics (titles[1] Ivals[1], titles[2] Ivals[2], titles[3] Ivals[3])

# write the arrays to a temporary data file for fitting and plotting
tmpfile = 'Mu3000_from_mcommon.dat'
set print tmpfile
do for [i=1:3] { print Ivals[i], muvals[i] }
set print


# initial guesses (tweakable)
mus = 0.33
mu2 = 0.6
I0 = 0.1

# Fit mu(x) to the generated data file
fit mu(x) tmpfile using 1:2 via mus, mu2, I0


set label 1 sprintf("$\\mu_s = %.4f$", mus) at graph 0.1, 0.8
set label 2 sprintf("$\\mu_2 = %.4f$", mu2) at graph 0.1, 0.7
set label 3 sprintf("$I_0 = %.4f$", I0) at graph 0.1, 0.6

plot tmpfile using 1:2 with points pt 7 ps 1.5 title "Données", \
     mu(x) with lines lw 2 lc rgb "red" title "$\\mu(I)$ régression"
rep
set output