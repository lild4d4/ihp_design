v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Off-Chip Compensation
} 720 170 3 0 0.4 0.4 {}
N 250 120 250 160 {
lab=iref_ldo1}
N 490 220 490 250 {
lab=GND}
N 350 220 350 250 {
lab=vss}
N 250 220 250 250 {
lab=vss}
N 490 120 490 160 {
lab=vss}
N 350 120 350 160 {
lab=vcm_ldo1}
N 790 -90 790 -60 {
lab=vout_ldo1}
N 790 0 790 40 {
lab=#net1}
N 790 100 790 120 {
lab=vss}
N 170 -210 270 -210 {
lab=vdd_ldo1}
N 170 -170 270 -170 {
lab=iref_ldo1}
N 170 -190 270 -190 {
lab=vcm_ldo1}
N 310 -70 310 -40 {
lab=vss}
N 600 -90 790 -90 {
lab=vout_ldo1}
N 880 -90 880 -20 {
lab=vout_ldo1}
N 790 -90 880 -90 {
lab=vout_ldo1}
N 880 40 880 120 {
lab=vss}
N 950 -90 950 -20 {
lab=vout_ldo1}
N 880 -90 950 -90 {
lab=vout_ldo1}
N 950 40 950 120 {
lab=vss}
N 600 -330 600 -90 {
lab=vout_ldo1}
N 240 -330 600 -330 {
lab=vout_ldo1}
N 240 -330 240 -230 {
lab=vout_ldo1}
N 240 -230 270 -230 {
lab=vout_ldo1}
N 60 220 60 250 {
lab=vss}
N 60 120 60 160 {
lab=vdd_ldo1}
C {devices/vsource.sym} 350 190 0 0 {name=V1 value=0.9 savecurrent=false}
C {devices/vsource.sym} 490 190 0 0 {name=V5 value=0 savecurrent=false}
C {devices/isource.sym} 250 190 2 0 {name=I0 value=5u}
C {devices/lab_pin.sym} 350 250 0 0 {name=p2 sig_type=std_logic lab=vss}
C {devices/gnd.sym} 490 250 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 490 120 0 0 {name=p5 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 310 -40 3 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 170 -190 0 0 {name=p13 sig_type=std_logic lab=vcm_ldo1}
C {devices/lab_pin.sym} 250 250 0 0 {name=p14 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 950 -90 2 0 {name=p15 sig_type=std_logic lab=vout_ldo1}
C {devices/lab_pin.sym} 250 120 0 0 {name=p12 sig_type=std_logic lab=iref_ldo1}
C {devices/lab_pin.sym} 170 -170 0 0 {name=p17 sig_type=std_logic lab=iref_ldo1}
C {devices/lab_pin.sym} 350 120 0 0 {name=p18 sig_type=std_logic lab=vcm_ldo1}
C {devices/lab_pin.sym} 170 -210 0 0 {name=p19 sig_type=std_logic lab=vdd_ldo1}
C {devices/capa.sym} 790 70 0 0 {name=Cc
m=1
value=10u
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 790 -30 0 0 {name=Resr
value=2
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 790 120 0 0 {name=p4 sig_type=std_logic lab=vss}
C {devices/title.sym} -180 500 0 0 {name=l2 author="Daniel Arevalos"}
C {devices/lab_pin.sym} 880 120 0 0 {name=p1 sig_type=std_logic lab=vss}
C {devices/res.sym} 880 10 0 0 {name=Resr1
value=12
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 950 10 0 0 {name=Cc1
m=1
value=50p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 950 120 0 0 {name=p3 sig_type=std_logic lab=vss}
C {devices/code_shown.sym} -790 -390 0 0 {name=SETUP only_toplevel=false value="* CACE gensim simulation file \{filename\}_\{N\}
* Generated by CACE gensim, Efabless Corporation (c) 2023
* Find the power supply rejection ratio of the amplifier

*.include \{DUT_path\}

.lib \{PDK_ROOT\}/\{PDK\}/libs.tech/ngspice/models/cornerMOSlv.lib mos_\{corner\}
.lib \{PDK_ROOT\}/\{PDK\}/libs.tech/ngspice/models/cornerRES.lib res_typ
.lib \{PDK_ROOT\}/\{PDK\}/libs.tech/ngspice/models/cornerCAP.lib cap_typ


.option TEMP=\{temperature\}
* Flag unsafe operating conditions (exceeds models' specified limits)
.option warn=1
"}
C {devices/vsource.sym} 60 190 0 0 {name=Vs value="1.8" savecurrent=false}
C {devices/lab_pin.sym} 60 250 0 0 {name=p6 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 60 120 0 0 {name=p7 sig_type=std_logic lab=vdd_ldo1}
C {devices/code_shown.sym} -900 30 0 0 {name=Line_reg_&_Dropout1 only_toplevel=false 

value="
.control

pre_osdi /home/ac3e/Documents/psp103_nqs.osdi

dc Vs 0 2.1 0.01
meas dc V_ldo_1.6 FIND v(vout_ldo1) WHEN v(vdd_ldo1)=1.6
meas dc V_ldo_2 FIND v(vout_ldo1) WHEN v(vdd_ldo1)=2 
let linereg = (V_ldo_2-V_ldo_1.6)/0.4

let der = deriv(vout_ldo1)

meas dc V_ldo_vdropout FIND v(vdd_ldo1) WHEN der=0.02 CROSS=LAST
let dropout = V_ldo_vdropout-1.2

*write ldo_ihp_v3_tb_closeloop_dc.raw
wrdata \{simpath\}/dropout_\{N\}.data dropout
wrdata \{simpath\}/linereg_\{N\}.data linereg
quit
.endc

.end
"}
C {/home/ac3e/Documents/ihp_design/xschem/top/TOP.sym} 370 -170 0 0 {name=x1}
