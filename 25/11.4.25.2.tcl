# This script is created by NSG2 beta1
# <http://wushoupong.googlepages.com/nsg>

#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     26                         ;# number of mobilenodes
set val(rp)     DSDV                       ;# routing protocol
set val(x)      2382                      ;# X dimension of topography
set val(y)      100                      ;# Y dimension of topography
set val(stop)   28.0                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open 11.4.25.1.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open 11.4.25.1.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#===================================
#     Mobile node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON


$ns node-config -energyModel EnergyModel \
		-txpPower 1.5 \
		-rxPower 0.5 \
		-idlePower 0.0 \
		-sensePower 0.00

#===================================
#        Nodes Definition        
#===================================
#Create 26 nodes
$ns node-config -initialEnergy 1
set n0 [$ns node]
$n0 set X_ 0
$n0 set Y_ 100
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20


$ns node-config -initialEnergy 1
set n1 [$ns node]
$n1 set X_ 701
$n1 set Y_ 900
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20


$ns node-config -initialEnergy 1
set n2 [$ns node]
$n2 set X_ 901
$n2 set Y_ 900
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20


$ns node-config -initialEnergy 1
set n3 [$ns node]
$n3 set X_ 1101
$n3 set Y_ 900
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20


$ns node-config -initialEnergy 1
set n4 [$ns node]
$n4 set X_ 1301
$n4 set Y_ 900
$n4 set Z_ 0.0
$ns initial_node_pos $n4 20


$ns node-config -initialEnergy 1
set n5 [$ns node]
$n5 set X_ 501
$n5 set Y_ 700
$n5 set Z_ 0.0
$ns initial_node_pos $n5 20


$ns node-config -initialEnergy 1
set n6 [$ns node]
$n6 set X_ 701
$n6 set Y_ 700
$n6 set Z_ 0.0
$ns initial_node_pos $n6 20



$ns node-config -initialEnergy 1
set n7 [$ns node]
$n7 set X_ 901
$n7 set Y_ 700
$n7 set Z_ 0.0
$ns initial_node_pos $n7 20



$ns node-config -initialEnergy 1
set n8 [$ns node]
$n8 set X_ 1101
$n8 set Y_ 700
$n8 set Z_ 0.0
$ns initial_node_pos $n8 20



$ns node-config -initialEnergy 1
set n9 [$ns node]
$n9 set X_ 1301
$n9 set Y_ 700
$n9 set Z_ 0.0
$ns initial_node_pos $n9 20



$ns node-config -initialEnergy 1
set n10 [$ns node]
$n10 set X_ 501
$n10 set Y_ 500
$n10 set Z_ 0.0
$ns initial_node_pos $n10 20



$ns node-config -initialEnergy 1
set n11 [$ns node]
$n11 set X_ 701
$n11 set Y_ 500
$n11 set Z_ 0.0
$ns initial_node_pos $n11 20



$ns node-config -initialEnergy 24
set n12 [$ns node]
$n12 set X_ 901
$n12 set Y_ 500
$n12 set Z_ 0.0
$ns initial_node_pos $n12 20



$ns node-config -initialEnergy 1
set n13 [$ns node]
$n13 set X_ 1101
$n13 set Y_ 500
$n13 set Z_ 0.0
$ns initial_node_pos $n13 20



$ns node-config -initialEnergy 1
set n14 [$ns node]
$n14 set X_ 1301
$n14 set Y_ 500
$n14 set Z_ 0.0
$ns initial_node_pos $n14 20



$ns node-config -initialEnergy 1
set n15 [$ns node]
$n15 set X_ 501
$n15 set Y_ 300
$n15 set Z_ 0.0
$ns initial_node_pos $n15 20



$ns node-config -initialEnergy 1
set n16 [$ns node]
$n16 set X_ 701
$n16 set Y_ 300
$n16 set Z_ 0.0
$ns initial_node_pos $n16 20



$ns node-config -initialEnergy 1
set n17 [$ns node]
$n17 set X_ 901
$n17 set Y_ 300
$n17 set Z_ 0.0
$ns initial_node_pos $n17 20




$ns node-config -initialEnergy 1
set n18 [$ns node]
$n18 set X_ 1101
$n18 set Y_ 300
$n18 set Z_ 0.0
$ns initial_node_pos $n18 20



$ns node-config -initialEnergy 1
set n19 [$ns node]
$n19 set X_ 1301
$n19 set Y_ 300
$n19 set Z_ 0.0
$ns initial_node_pos $n19 20




$ns node-config -initialEnergy 1
set n20 [$ns node]
$n20 set X_ 501
$n20 set Y_ 100
$n20 set Z_ 0.0
$ns initial_node_pos $n20 20



$ns node-config -initialEnergy 1
set n21 [$ns node]
$n21 set X_ 701
$n21 set Y_ 100
$n21 set Z_ 0.0
$ns initial_node_pos $n21 20



$ns node-config -initialEnergy 1
set n22 [$ns node]
$n22 set X_ 901
$n22 set Y_ 100
$n22 set Z_ 0.0
$ns initial_node_pos $n22 20



$ns node-config -initialEnergy 1
set n23 [$ns node]
$n23 set X_ 1101
$n23 set Y_ 100
$n23 set Z_ 0.0
$ns initial_node_pos $n23 20



$ns node-config -initialEnergy 1
set n24 [$ns node]
$n24 set X_ 1301
$n24 set Y_ 100
$n24 set Z_ 0.0
$ns initial_node_pos $n24 20



$ns node-config -initialEnergy 24
set n25 [$ns node]
$n25 set X_ 905
$n25 set Y_ 505
$n25 set Z_ 0.0
$ns initial_node_pos $n25 20



set en0 [$n0 energy]
set en1 [$n1 energy]
set en2 [$n2 energy]
set en3 [$n3 energy]
set en4 [$n4 energy]

set en5 [$n5 energy]
set en6 [$n6 energy]
set en7 [$n7 energy]
set en8 [$n8 energy]
set en9 [$n9 energy]

set en10 [$n10 energy]
set en11 [$n11 energy]
set en12 [$n12 energy]
set en13 [$n13 energy]
set en14 [$n14 energy]

set en15 [$n15 energy]
set en16 [$n16 energy]
set en17 [$n17 energy]
set en18 [$n18 energy]
set en19 [$n19 energy]

set en20 [$n20 energy]
set en21 [$n21 energy]
set en22 [$n22 energy]
set en23 [$n23 energy]
set en24 [$n24 energy]
set en25 [$n25 energy]


#===================================
#        Agents Definition        
#===================================
#Setup a TCP connection
set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0
set sink24 [new Agent/TCPSink]
$ns attach-agent $n12 $sink24
$ns connect $tcp0 $sink24
$tcp0 set packetSize_ 1500

#Setup a TCP connection
set tcp1 [new Agent/TCP]
$ns attach-agent $n1 $tcp1
set sink25 [new Agent/TCPSink]
$ns attach-agent $n12 $sink25
$ns connect $tcp1 $sink25
$tcp1 set packetSize_ 1500

#Setup a TCP connection
set tcp2 [new Agent/TCP]
$ns attach-agent $n2 $tcp2
set sink26 [new Agent/TCPSink]
$ns attach-agent $n12 $sink26
$ns connect $tcp2 $sink26
$tcp2 set packetSize_ 1500

#Setup a TCP connection
set tcp3 [new Agent/TCP]
$ns attach-agent $n3 $tcp3
set sink27 [new Agent/TCPSink]
$ns attach-agent $n12 $sink27
$ns connect $tcp3 $sink27
$tcp3 set packetSize_ 1500

#Setup a TCP connection
set tcp4 [new Agent/TCP]
$ns attach-agent $n4 $tcp4
set sink28 [new Agent/TCPSink]
$ns attach-agent $n12 $sink28
$ns connect $tcp4 $sink28
$tcp4 set packetSize_ 1500

#Setup a TCP connection
set tcp5 [new Agent/TCP]
$ns attach-agent $n5 $tcp5
set sink29 [new Agent/TCPSink]
$ns attach-agent $n12 $sink29
$ns connect $tcp5 $sink29
$tcp5 set packetSize_ 1500

#Setup a TCP connection
set tcp6 [new Agent/TCP]
$ns attach-agent $n6 $tcp6
set sink30 [new Agent/TCPSink]
$ns attach-agent $n12 $sink30
$ns connect $tcp6 $sink30
$tcp6 set packetSize_ 1500

#Setup a TCP connection
set tcp7 [new Agent/TCP]
$ns attach-agent $n7 $tcp7
set sink31 [new Agent/TCPSink]
$ns attach-agent $n12 $sink31
$ns connect $tcp7 $sink31
$tcp7 set packetSize_ 1500

#Setup a TCP connection
set tcp8 [new Agent/TCP]
$ns attach-agent $n8 $tcp8
set sink32 [new Agent/TCPSink]
$ns attach-agent $n12 $sink32
$ns connect $tcp8 $sink32
$tcp8 set packetSize_ 1500

#Setup a TCP connection
set tcp9 [new Agent/TCP]
$ns attach-agent $n9 $tcp9
set sink33 [new Agent/TCPSink]
$ns attach-agent $n12 $sink33
$ns connect $tcp9 $sink33
$tcp9 set packetSize_ 1500

#Setup a TCP connection
set tcp10 [new Agent/TCP]
$ns attach-agent $n10 $tcp10
set sink34 [new Agent/TCPSink]
$ns attach-agent $n12 $sink34
$ns connect $tcp10 $sink34
$tcp10 set packetSize_ 1500

#Setup a TCP connection
set tcp11 [new Agent/TCP]
$ns attach-agent $n11 $tcp11
set sink35 [new Agent/TCPSink]
$ns attach-agent $n12 $sink35
$ns connect $tcp11 $sink35
$tcp11 set packetSize_ 1500

#Setup a TCP connection
set tcp12 [new Agent/TCP]
$ns attach-agent $n13 $tcp12
set sink36 [new Agent/TCPSink]
$ns attach-agent $n12 $sink36
$ns connect $tcp12 $sink36
$tcp12 set packetSize_ 1500

#Setup a TCP connection
set tcp13 [new Agent/TCP]
$ns attach-agent $n14 $tcp13
set sink37 [new Agent/TCPSink]
$ns attach-agent $n12 $sink37
$ns connect $tcp13 $sink37
$tcp13 set packetSize_ 1500

#Setup a TCP connection
set tcp14 [new Agent/TCP]
$ns attach-agent $n15 $tcp14
set sink38 [new Agent/TCPSink]
$ns attach-agent $n12 $sink38
$ns connect $tcp14 $sink38
$tcp14 set packetSize_ 1500

#Setup a TCP connection
set tcp15 [new Agent/TCP]
$ns attach-agent $n16 $tcp15
set sink39 [new Agent/TCPSink]
$ns attach-agent $n12 $sink39
$ns connect $tcp15 $sink39
$tcp15 set packetSize_ 1500

#Setup a TCP connection
set tcp16 [new Agent/TCP]
$ns attach-agent $n17 $tcp16
set sink40 [new Agent/TCPSink]
$ns attach-agent $n12 $sink40
$ns connect $tcp16 $sink40
$tcp16 set packetSize_ 1500

#Setup a TCP connection
set tcp17 [new Agent/TCP]
$ns attach-agent $n18 $tcp17
set sink41 [new Agent/TCPSink]
$ns attach-agent $n12 $sink41
$ns connect $tcp17 $sink41
$tcp17 set packetSize_ 1500

#Setup a TCP connection
set tcp18 [new Agent/TCP]
$ns attach-agent $n19 $tcp18
set sink42 [new Agent/TCPSink]
$ns attach-agent $n12 $sink42
$ns connect $tcp18 $sink42
$tcp18 set packetSize_ 1500

#Setup a TCP connection
set tcp19 [new Agent/TCP]
$ns attach-agent $n20 $tcp19
set sink43 [new Agent/TCPSink]
$ns attach-agent $n12 $sink43
$ns connect $tcp19 $sink43
$tcp19 set packetSize_ 1500

#Setup a TCP connection
set tcp20 [new Agent/TCP]
$ns attach-agent $n21 $tcp20
set sink44 [new Agent/TCPSink]
$ns attach-agent $n12 $sink44
$ns connect $tcp20 $sink44
$tcp20 set packetSize_ 1500

#Setup a TCP connection
set tcp21 [new Agent/TCP]
$ns attach-agent $n22 $tcp21
set sink45 [new Agent/TCPSink]
$ns attach-agent $n12 $sink45
$ns connect $tcp21 $sink45
$tcp21 set packetSize_ 1500

#Setup a TCP connection
set tcp22 [new Agent/TCP]
$ns attach-agent $n23 $tcp22
set sink46 [new Agent/TCPSink]
$ns attach-agent $n12 $sink46
$ns connect $tcp22 $sink46
$tcp22 set packetSize_ 1500

#Setup a TCP connection
set tcp23 [new Agent/TCP]
$ns attach-agent $n24 $tcp23
set sink47 [new Agent/TCPSink]
$ns attach-agent $n12 $sink47
$ns connect $tcp23 $sink47
$tcp23 set packetSize_ 1500

#Setup a TCP connection
set tcp48 [new Agent/TCP]
$ns attach-agent $n12 $tcp48
set sink49 [new Agent/TCPSink]
$ns attach-agent $n25 $sink49
$ns connect $tcp48 $sink49


#===================================
#        Applications Definition  
set l1 [expr {0.0203*50*1.414}]
set l2 [expr {0.0203*50}]
set l3 [expr {0.0203*25*1.414}]
set l4 [expr {0.0203*25}]
set l5 [expr {0.0203*25*2.236}]



set k [expr {11*pow(10, 6)}]
set elec [expr {pow(10, -12)}]
set eamp [expr {13*pow(10, -16)}]


set dsq1 [expr {pow(50,2)*2}]
set dsq2 [expr {pow(50,2)}]
set dsq3 [expr {pow(25,2)*2}]
set dsq4 [expr {pow(25,2)}]
set dsq5 [expr {pow(25,2)*5}]

set count 0      
#===================================

while { $en0 > 0 || $en1 > 0 || $en2 > 0 || $en3 > 0 || $en4 > 0 || $en5 > 0 || $en6 > 0 || $en7 > 0  || $en8 > 0 || $en9 > 0 || $en10 > 0 || $en11 > 0 || $en13 > 0 || $en14 > 0 || $en15 > 0 || $en16 > 0 || $en17 > 0 || $en18 > 0 || $en19 > 0 || $en20 > 0 || $en21 > 0 || $en22 > 0 || $en23 > 0 || $en24 > 0 && $en12 > 0 } {

    #Setup a FTP Application over TCP connection
    set ftp0 [new Application/FTP]
    $ftp0 attach-agent $tcp0
    $ns at 1.0 "$ftp0 start"
    $ns at 2.0 "$ftp0 stop"
    set etx0 [expr { $k*$elec + $k*$dsq1*$eamp*exp($l1) }]
    set en0 [expr { $en0 - $etx0 }]


    #Setup a FTP Application over TCP connection
    set ftp1 [new Application/FTP]
    $ftp1 attach-agent $tcp1
    $ns at 2.0 "$ftp1 start"
    $ns at 3.0 "$ftp1 stop"
    set etx1 [expr { $k*$elec + $k*$dsq5*$eamp*exp($l5) }]
    set en1 [expr { $en1 - $etx1 }]



    #Setup a FTP Application over TCP connection
    set ftp2 [new Application/FTP]
    $ftp2 attach-agent $tcp2
    $ns at 3.0 "$ftp2 start"
    $ns at 4.0 "$ftp2 stop"
    set etx2 [expr { $k*$elec + $k*$dsq2*$eamp*exp($l2) }]
    set en2 [expr { $en2 - $etx2 }]

    #Setup a FTP Application over TCP connection
    set ftp3 [new Application/FTP]
    $ftp3 attach-agent $tcp3
    $ns at 4.0 "$ftp3 start"
    $ns at 5.0 "$ftp3 stop"
    set etx3 [expr { $k*$elec + $k*$dsq5*$eamp*exp($l5) }]
    set en3 [expr { $en3 - $etx3 }]



    #Setup a FTP Application over TCP connection
    set ftp4 [new Application/FTP]
    $ftp4 attach-agent $tcp4
    $ns at 5.0 "$ftp4 start"
    $ns at 6.0 "$ftp4 stop"
    set etx4 [expr { $k*$elec + $k*$dsq1*$eamp*exp($l1) }]
    set en4 [expr { $en4 - $etx4 }]




    #Setup a FTP Application over TCP connection
    set ftp5 [new Application/FTP]
    $ftp5 attach-agent $tcp5
    $ns at 6.0 "$ftp5 start"
    $ns at 7.0 "$ftp5 stop"
    set etx5 [expr { $k*$elec + $k*$dsq5*$eamp*exp($l5) }]
    set en5 [expr { $en5 - $etx5 }]



    #Setup a FTP Application over TCP connection
    set ftp6 [new Application/FTP]
    $ftp6 attach-agent $tcp6
    $ns at 7.0 "$ftp6 start"
    $ns at 8.0 "$ftp6 stop"
    set etx6 [expr { $k*$elec + $k*$dsq3*$eamp*exp($l3) }]
    set en6 [expr { $en6 - $etx6 }]



    #Setup a FTP Application over TCP connection
    set ftp7 [new Application/FTP]
    $ftp7 attach-agent $tcp7
    $ns at 8.0 "$ftp7 start"
    $ns at 9.0 "$ftp7 stop"
    set etx7 [expr { $k*$elec + $k*$dsq4*$eamp*exp($l4) }]
    set en7 [expr { $en7 - $etx7 }]



    #Setup a FTP Application over TCP connection
    set ftp8 [new Application/FTP]
    $ftp8 attach-agent $tcp8
    $ns at 9.0 "$ftp8 start"
    $ns at 10.0 "$ftp8 stop"
    set etx8 [expr { $k*$elec + $k*$dsq3*$eamp*exp($l3) }]
    set en8 [expr { $en8 - $etx8 }]


    #Setup a FTP Application over TCP connection
    set ftp9 [new Application/FTP]
    $ftp9 attach-agent $tcp9
    $ns at 10.0 "$ftp9 start"
    $ns at 11.0 "$ftp9 stop"
    set etx9 [expr { $k*$elec + $k*$dsq5*$eamp*exp($l5) }]
    set en9 [expr { $en9 - $etx9 }]



    #Setup a FTP Application over TCP connection
    set ftp10 [new Application/FTP]
    $ftp10 attach-agent $tcp10
    $ns at 12.0 "$ftp10 start"
    $ns at 13.0 "$ftp10 stop"
    set etx10 [expr { $k*$elec + $k*$dsq1*$eamp*exp($l2) }]
    set en10 [expr { $en10 - $etx10 }]

    #Setup a FTP Application over TCP connection
    set ftp11 [new Application/FTP]
    $ftp11 attach-agent $tcp11
    $ns at 13.0 "$ftp11 start"
    $ns at 14.0 "$ftp11 stop"
    set etx11 [expr { $k*$elec + $k*$dsq4*$eamp*exp($l4) }]
    set en11 [expr { $en11 - $etx11 }]



    #Setup a FTP Application over TCP connection
    set ftp12 [new Application/FTP]
    $ftp12 attach-agent $tcp12
    $ns at 14.0 "$ftp12 start"
    $ns at 15.0 "$ftp12 stop"
    set etx12 [expr { 24*$k*$elec + 24*$k*$dsq4*$eamp*exp($l4) + 24*$k*pow(10, -12) }]
    set en12 [expr { $en12 - $etx12 }]




    #Setup a FTP Application over TCP connection
    set ftp13 [new Application/FTP]
    $ftp13 attach-agent $tcp13
    $ns at 15.0 "$ftp13 start"
    $ns at 16.0 "$ftp13 stop"
    set etx13 [expr { $k*$elec + $k*$dsq4*$eamp*exp($l4) }]
    set en13 [expr { $en13 - $etx13 }]




    #Setup a FTP Application over TCP connection
    set ftp14 [new Application/FTP]
    $ftp14 attach-agent $tcp14
    $ns at 16.0 "$ftp14 start"
    $ns at 17.0 "$ftp14 stop"
    set etx14 [expr { $k*$elec + $k*$dsq1*$eamp*exp($l2) }]
    set en14 [expr { $en14 - $etx14 }]



    #Setup a FTP Application over TCP connection
    set ftp15 [new Application/FTP]
    $ftp15 attach-agent $tcp15
    $ns at 17.0 "$ftp15 start"
    $ns at 18.0 "$ftp15 stop"
    set etx15 [expr { $k*$elec + $k*$dsq5*$eamp*exp($l5) }]
    set en15 [expr { $en15 - $etx15 }]





    #Setup a FTP Application over TCP connection
    set ftp16 [new Application/FTP]
    $ftp16 attach-agent $tcp16
    $ns at 18.0 "$ftp16 start"
    $ns at 19.0 "$ftp16 stop"
    set etx16 [expr { $k*$elec + $k*$dsq3*$eamp*exp($l3) }]
    set en16 [expr { $en16 - $etx16 }]




    #Setup a FTP Application over TCP connection
    set ftp17 [new Application/FTP]
    $ftp17 attach-agent $tcp17
    $ns at 19.0 "$ftp17 start"
    $ns at 20.0 "$ftp17 stop"
    set etx17 [expr { $k*$elec + $k*$dsq4*$eamp*exp($l4) }]
    set en17 [expr { $en17 - $etx17 }]



    #Setup a FTP Application over TCP connection
    set ftp18 [new Application/FTP]
    $ftp18 attach-agent $tcp18
    $ns at 20.0 "$ftp18 start"
    $ns at 21.0 "$ftp18 stop"
    set etx18 [expr { $k*$elec + $k*$dsq3*$eamp*exp($l3) }]
    set en18 [expr { $en18 - $etx18 }]





    #Setup a FTP Application over TCP connection
    set ftp19 [new Application/FTP]
    $ftp19 attach-agent $tcp19
    $ns at 21.0 "$ftp19 start"
    $ns at 22.0 "$ftp19 stop"
    set etx19 [expr { $k*$elec + $k*$dsq5*$eamp*exp($l5) }]
    set en19 [expr { $en19 - $etx19 }]





    #Setup a FTP Application over TCP connection
    set ftp20 [new Application/FTP]
    $ftp20 attach-agent $tcp20
    $ns at 22.0 "$ftp20 start"
    $ns at 23.0 "$ftp20 stop"
    set etx20 [expr { $k*$elec + $k*$dsq1*$eamp*exp($l1) }]
    set en20 [expr { $en20 - $etx20 }]




    #Setup a FTP Application over TCP connection
    set ftp21 [new Application/FTP]
    $ftp21 attach-agent $tcp21
    $ns at 23.0 "$ftp21 start"
    $ns at 24.0 "$ftp21 stop"
    set etx21 [expr { $k*$elec + $k*$dsq5*$eamp*exp($l5) }]
    set en21 [expr { $en21 - $etx21 }]




    #Setup a FTP Application over TCP connection
    set ftp22 [new Application/FTP]
    $ftp22 attach-agent $tcp22
    $ns at 24.0 "$ftp22 start"
    $ns at 25.0 "$ftp22 stop"
    set etx22 [expr { $k*$elec + $k*$dsq1*$eamp*exp($l2) }]
    set en22 [expr { $en22 - $etx22 }]





    #Setup a FTP Application over TCP connection
    set ftp23 [new Application/FTP]
    $ftp23 attach-agent $tcp23
    $ns at 25.0 "$ftp23 start"
    $ns at 26.0 "$ftp23 stop"
    set etx23 [expr { $k*$elec + $k*$dsq5*$eamp*exp($l5) }]
    set en23 [expr { $en23 - $etx23 }]





    #Setup a FTP Application over TCP connection
    set ftp24 [new Application/FTP]
    $ftp24 attach-agent $tcp48
    $ns at 26.0 "$ftp24 start"
    $ns at 27.0 "$ftp24 stop"
    set etx24 [expr { $k*$elec + $k*$dsq1*$eamp*exp($l1) }]
    set en24 [expr { $en24 - $etx24 }]


    set count [expr { $count + 1 }]
	puts stdout "Node0 $en0"
	puts stdout "Node1 $en1"
	puts stdout "Node2 $en2"
    puts stdout "Node3 $en3"
	puts stdout "Node4 $en4"
	puts stdout "Node5 $en5"
    puts stdout "Node6 $en6"
	puts stdout "Node7 $en7"
	puts stdout "Node8 $en8"
    puts stdout "Node9 $en9"
	puts stdout "Node10 $en10"
	puts stdout "Node11 $en11"
    puts stdout "Node12 $en12"
	puts stdout "Node13 $en13"
	puts stdout "Node14 $en14"
    puts stdout "Node15 $en15"
	puts stdout "Node16 $en16"
	puts stdout "Node17 $en17"
    puts stdout "Node18 $en18"
	puts stdout "Node19 $en19"
	puts stdout "Node20 $en20"
    puts stdout "Node21 $en21"
	puts stdout "Node22 $en22"
	puts stdout "Node23 $en23"
    puts stdout "Node24 $en24"
	puts stdout "count $count"
	puts stdout "\n\n"
}

#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam 11.4.25.1.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n$i reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
