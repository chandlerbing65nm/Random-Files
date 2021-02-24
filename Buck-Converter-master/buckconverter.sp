*  Generated for: HSPICE
*  Design library name: EE277
*  Design cell name: buck-converter
*  Design view name: schematic



.option PARHIER = LOCAL
.option PORT_VOLTAGE_SCALE_TO_2X = 1

.option ARTIST=2 PSF=2
.temp 25
.lib '/home/TSMC180nm/models/hspice/rf018.l' TT
*Custom Compiler Version N-2017.12-3
*Fri Jun  1 11:32:23 2018

.GLOBAL gnd! vdd!
********************************************************************************
* Library          : EE277
* Cell             : error-amplifier
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
.subckt error-amplifier iref vinn vinp vout
mn1 net8 vinn net7 gnd! nch l=1u w=4u m=2 ad=1.92e-12 as=1.92e-12 pd=8.96e-06
+ ps=8.96e-06 nrd=0.0675 nrs=0.0675
mn2 net5 vinp net7 gnd! nch l=1u w=4u m=2 ad=1.92e-12 as=1.92e-12 pd=8.96e-06
+ ps=8.96e-06 nrd=0.0675 nrs=0.0675
mn4 net7 iref gnd! gnd! nch l=1u w=4u m=4 ad=1.92e-12 as=1.92e-12 pd=8.96e-06
+ ps=8.96e-06 nrd=0.0675 nrs=0.0675
mn3 iref iref gnd! gnd! nch l=1u w=4u m=8 ad=1.92e-12 as=1.92e-12 pd=8.96e-06
+ ps=8.96e-06 nrd=0.0675 nrs=0.0675
mn5 vout iref gnd! gnd! nch l=1u w=4u m=12 ad=1.92e-12 as=1.92e-12 pd=8.96e-06
+ ps=8.96e-06 nrd=0.0675 nrs=0.0675
c0 net9 vout c=2.8p
mres net9 gnd! net5 vdd! pch l=1u w=4u m=3 ad=1.92e-12 as=1.92e-12 pd=8.96e-06
+ ps=8.96e-06 nrd=0.0675 nrs=0.0675
mp3 vout net5 vdd! vdd! pch l=1u w=4u m=36 ad=1.92e-12 as=1.92e-12 pd=8.96e-06
+ ps=8.96e-06 nrd=0.0675 nrs=0.0675
mp1 net8 net8 vdd! vdd! pch l=1u w=4u m=6 ad=1.92e-12 as=1.92e-12 pd=8.96e-06
+ ps=8.96e-06 nrd=0.0675 nrs=0.0675
mp2 net5 net8 vdd! vdd! pch l=1u w=4u m=6 ad=1.92e-12 as=1.92e-12 pd=8.96e-06
+ ps=8.96e-06 nrd=0.0675 nrs=0.0675
.ends error-amplifier

********************************************************************************
* Library          : EE277
* Cell             : feedbacksystem
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
.subckt feedbacksystem vcomp vout vref ibias
xi0 ibias net19 vref vcomp error-amplifier
r2 net19 gnd! r=68.1k
rz2 vcomp net14 r=35.985k
rz3 net19 net10 r=2.908k
r1 net19 vout r=68.1k
cp1 net19 vcomp c=8.846p
cz2 net19 net14 c=207.14p
cz3 vout net10 c=109.45p
.ends feedbacksystem

********************************************************************************
* Library          : EE277
* Cell             : driver
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
.subckt driver input output vs
mp4 output net5 vs vs pch l=1u w=10u m=900 ad=4.8e-12 as=4.8e-12 pd=2.096e-05
+ ps=2.096e-05 nrd=0.027 nrs=0.027
mp3 net5 net2 vs vs pch l=1u w=10u m=600 ad=4.8e-12 as=4.8e-12 pd=2.096e-05 ps=2.096e-05
+  nrd=0.027 nrs=0.027
mp2 net2 net3 vs vs pch l=1u w=10u m=90 ad=4.8e-12 as=4.8e-12 pd=2.096e-05 ps=2.096e-05
+  nrd=0.027 nrs=0.027
mp1 net3 input vs vs pch l=1u w=10u m=9 ad=4.8e-12 as=4.8e-12 pd=2.096e-05 ps=2.096e-05
+  nrd=0.027 nrs=0.027
mn4 output net5 gnd! gnd! nch l=1u w=10u m=300 ad=4.8e-12 as=4.8e-12 pd=2.096e-05
+  ps=2.096e-05 nrd=0.027 nrs=0.027
mn3 net5 net2 gnd! gnd! nch l=1u w=10u m=200 ad=4.8e-12 as=4.8e-12 pd=2.096e-05
+ ps=2.096e-05 nrd=0.027 nrs=0.027
mn2 net2 net3 gnd! gnd! nch l=1u w=10u m=10 ad=4.8e-12 as=4.8e-12 pd=2.096e-05
+ ps=2.096e-05 nrd=0.027 nrs=0.027
mn1 net3 input gnd! gnd! nch l=1u w=10u m=3 ad=4.8e-12 as=4.8e-12 pd=2.096e-05
+ ps=2.096e-05 nrd=0.027 nrs=0.027
.ends driver

********************************************************************************
* Library          : EE277
* Cell             : buck-converter
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
ms2 vdutyc vpulse gnd! gnd! nch l=1u w=10u m=300 ad=4.8e-12 as=4.8e-12 pd=2.096e-05
+  ps=2.096e-05 nrd=0.027 nrs=0.027
lccm vdutyc vout l=10u
resr vout net2 r=1m
c net2 gnd! c=2u
i21 vdd! iref dc=71.72u
iload vout net6 dc=300m
v3 vdd! gnd! dc=1.8
v17 vref gnd! dc=.9 ac=0
v0 net6 gnd! dc=0
v34 vsource gnd! dc=3
ms1 vdutyc vpulse vsource vsource pch l=1u w=10u m=900 ad=4.8e-12 as=4.8e-12 pd=2.096e-05
+  ps=2.096e-05 nrd=0.027 nrs=0.027
xi3 vfb vout vref iref feedbacksystem
e42 vcomp gnd! vcvs vramp vfb 1meg max=1.8 min=0 abs=0
v15 vramp gnd! dc=1.8 ac=0 pwl ( 0 0.0 2u 1.06 2.001u 0 r=0 td=0 )
xi4 vcomp vpulse vsource driver









.tran 0.01u 200u start=0
.option opfile=1 split_dp=1
.option probe=1
.probe tran v(*) level=1
.probe tran v(vout)




.end