v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Off-Chip resistanace} 580 400 3 0 0.4 0.4 {}
N 100 -160 100 -120 {
lab=vss}
N 440 150 660 150 {
lab=vout}
N -70 130 -70 160 {
lab=pos}
N -70 220 -70 250 {
lab=vin}
N 660 260 660 300 {
lab=#net1}
N 660 360 660 380 {
lab=vss}
N 660 150 660 210 {
lab=vout}
N 40 230 40 260 {
lab=vdiv}
N 740 300 740 380 {
lab=vss}
N 810 300 810 380 {
lab=vss}
N 810 150 850 150 {
lab=vout}
N 810 150 810 240 {
lab=vout}
N 740 150 810 150 {
lab=vout}
N 140 -390 140 -360 {
lab=iref}
N 120 -390 120 -360 {
lab=vcm}
N 100 -390 100 -360 {
lab=vdd}
N 180 -390 180 -360 {
lab=pos}
N 200 -390 200 -360 {
lab=vdiv}
N 40 130 40 170 {
lab=pos}
N -70 130 40 130 {
lab=pos}
N 40 90 40 130 {
lab=pos}
N 440 -470 440 150 {
lab=vout}
N 160 -470 440 -470 {
lab=vout}
N 160 -470 160 -360 {
lab=vout}
N 740 150 740 240 {
lab=vout}
N 660 150 740 150 {
lab=vout}
N -320 360 -320 400 {
lab=iref}
N -80 460 -80 490 {
lab=GND}
N -220 460 -220 490 {
lab=vss}
N -320 460 -320 490 {
lab=vss}
N -80 360 -80 400 {
lab=vss}
N -220 360 -220 400 {
lab=vcm}
N -510 460 -510 490 {
lab=vss}
N -510 360 -510 400 {
lab=vdd}
N -410 190 -410 220 {
lab=vss}
N -410 90 -410 130 {
lab=vin}
C {devices/lab_pin.sym} 100 -120 2 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 120 -390 1 0 {name=p13 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 850 150 2 0 {name=p15 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} 140 -390 1 0 {name=p17 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} 100 -390 1 0 {name=p19 sig_type=std_logic lab=vdd}
C {devices/capa.sym} -70 190 0 0 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} -70 250 0 0 {name=p4 sig_type=std_logic lab=vin}
C {devices/ind.sym} 40 200 0 0 {name=L2
m=1
value=10
footprint=1206
device=inductor}
C {devices/capa.sym} 660 330 0 0 {name=C1
m=1
value=10u
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 660 230 0 0 {name=R3
value=2
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 660 380 0 0 {name=p6 sig_type=std_logic lab=vss}
C {devices/code.sym} -730 150 0 0 {name=Transient_Simulation only_toplevel=false spice_ignore=1

value="
.control
tran 10n 1u
plot v(vout) v(pos) v(vcm)
.endc
.end

.control
tran 1e-6 1e-3
write test_tran.raw 
noise v(vout) Vin dec 333 10 100e3
print inoise_total onoise_total
setplot noise1
plot onoise_spectrum
.endc
"}
C {devices/lab_pin.sym} 740 380 0 0 {name=p3 sig_type=std_logic lab=vss}
C {devices/res.sym} 740 270 0 0 {name=Resr1
value=12
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 810 270 0 0 {name=Cc1
m=1
value=50p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 810 380 0 0 {name=p8 sig_type=std_logic lab=vss}
C {/home/ac3e/Documents/ihp_design/xschem/TOP.sym} 160 -260 0 0 {name=x1}
C {devices/lab_pin.sym} -70 250 0 0 {name=p10 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 180 -390 1 0 {name=p11 sig_type=std_logic lab=pos}
C {devices/lab_pin.sym} 200 -390 1 0 {name=p16 sig_type=std_logic lab=vdiv
}
C {devices/lab_pin.sym} 40 260 2 0 {name=p20 sig_type=std_logic lab=vdiv
}
C {devices/lab_pin.sym} 40 90 2 0 {name=p1 sig_type=std_logic lab=pos}
C {devices/code_shown.sym} -1240 30 0 0 {name=Open_loop_simulation only_toplevel=false 

value="

*Simulation
.control
pre_osdi /home/ac3e/Documents/psp103_nqs.osdi
  
ac dec 100 1 10G
setplot ac1
meas ac GBW when vdb(vout)=0
meas ac DCG find vdb(vout) at=1
let Openloop_Gain = DCG
meas ac PM find vp(vout) when vdb(vout)=0
let Phase_Margin = PM*180/PI

meas ac GM find vdb(vout) when vp(vout)=0

wrdata \{simpath\}/\{filename\}_\{N\}.data Openloop_Gain
wrdata \{simpath\}/\{filename\}_\{N\}.data Phase_Margin
quit
.endc

.end
"}
C {devices/code_shown.sym} -800 -440 0 0 {name=SETUP only_toplevel=false value="* CACE gensim simulation file \{filename\}_\{N\}
* Generated by CACE gensim, Efabless Corporation (c) 2023
* Find the power supply rejection ratio of the amplifier

*.include \{DUT_path\}

.lib \{PDK_ROOT\}/\{PDK\}/libs.tech/ngspice/models/cornerMOSlv.lib \{corner\}
.lib \{PDK_ROOT\}/\{PDK\}/libs.tech/ngspice/models/cornerRES.lib \{corner\}
.lib \{PDK_ROOT\}/\{PDK\}/libs.tech/ngspice/models/cornerCAP.lib \{corner\}

.param R=12

.option TEMP=\{temperature\}
* Flag unsafe operating conditions (exceeds models' specified limits)
.option warn=1
"}
C {devices/vsource.sym} -220 430 0 0 {name=V2 value=0.9 savecurrent=false}
C {devices/vsource.sym} -80 430 0 0 {name=V3 value=0 savecurrent=false}
C {devices/isource.sym} -320 430 2 0 {name=I1 value=5u}
C {devices/lab_pin.sym} -220 490 0 0 {name=p7 sig_type=std_logic lab=vss}
C {devices/gnd.sym} -80 490 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -80 360 0 0 {name=p21 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} -320 490 0 0 {name=p22 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} -320 360 0 0 {name=p23 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} -220 360 0 0 {name=p24 sig_type=std_logic lab=vcm}
C {devices/vsource.sym} -510 430 0 0 {name=Vs value="1.8" savecurrent=false}
C {devices/lab_pin.sym} -510 490 0 0 {name=p25 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} -510 360 0 0 {name=p26 sig_type=std_logic lab=vdd}
C {devices/vsource.sym} -410 160 0 0 {name=Vs1 value="0 AC 1" savecurrent=false}
C {devices/lab_pin.sym} -410 220 0 0 {name=p2 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} -410 90 0 0 {name=p5 sig_type=std_logic lab=vin}
