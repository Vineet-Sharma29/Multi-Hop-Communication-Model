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
set val(nn)     16                         ;# number of mobilenodes
set val(rp)     DSDV                       ;# routing protocol
set val(x)      3496                      ;# X dimension of topography
set val(y)      100                      ;# Y dimension of topography
set val(stop)   17.0                         ;# time of simulation end

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
set tracefile [open 11.4.16.1.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open 11.4.16.1.nam w]
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
#Create 16 nodes
$ns node-config -initialEnergy 1
set n0 [$ns node]
$n0 set X_ 0
$n0 set Y_ 995
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20




$ns node-config -initialEnergy 1
set n1 [$ns node]
$n1 set X_ 1098
$n1 set Y_ 995
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20




$ns node-config -initialEnergy 1
set n2 [$ns node]
$n2 set X_ 1398
$n2 set Y_ 995
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20



$ns node-config -initialEnergy 1
set n3 [$ns node]
$n3 set X_ 1698
$n3 set Y_ 995
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20



$ns node-config -initialEnergy 1
set n4 [$ns node]
$n4 set X_ 798
$n4 set Y_ 695
$n4 set Z_ 0.0
$ns initial_node_pos $n4 20




$ns node-config -initialEnergy 15
set n5 [$ns node]
$n5 set X_ 1098
$n5 set Y_ 695
$n5 set Z_ 0.0
$ns initial_node_pos $n5 20




$ns node-config -initialEnergy 1
set n6 [$ns node]
$n6 set X_ 1398
$n6 set Y_ 695
$n6 set Z_ 0.0
$ns initial_node_pos $n6 20




$ns node-config -initialEnergy 1
set n7 [$ns node]
$n7 set X_ 1698
$n7 set Y_ 695
$n7 set Z_ 0.0
$ns initial_node_pos $n7 20





$ns node-config -initialEnergy 1
set n8 [$ns node]
$n8 set X_ 798
$n8 set Y_ 395
$n8 set Z_ 0.0
$ns initial_node_pos $n8 20




$ns node-config -initialEnergy 1
set n9 [$ns node]
$n9 set X_ 1098
$n9 set Y_ 395
$n9 set Z_ 0.0
$ns initial_node_pos $n9 20




$ns node-config -initialEnergy 1
set n10 [$ns node]
$n10 set X_ 1398
$n10 set Y_ 395
$n10 set Z_ 0.0
$ns initial_node_pos $n10 20




$ns node-config -initialEnergy 1
set n11 [$ns node]
$n11 set X_ 1698
$n11 set Y_ 395
$n11 set Z_ 0.0
$ns initial_node_pos $n11 20




$ns node-config -initialEnergy 1
set n12 [$ns node]
$n12 set X_ 798
$n12 set Y_ 95
$n12 set Z_ 0.0
$ns initial_node_pos $n12 20




$ns node-config -initialEnergy 1
set n13 [$ns node]
$n13 set X_ 1098
$n13 set Y_ 95
$n13 set Z_ 0.0
$ns initial_node_pos $n13 20




$ns node-config -initialEnergy 1
set n14 [$ns node]
$n14 set X_ 1398
$n14 set Y_ 95
$n14 set Z_ 0.0
$ns initial_node_pos $n14 20




$ns node-config -initialEnergy 1
set n15 [$ns node]
$n15 set X_ 1698
$n15 set Y_ 95
$n15 set Z_ 0.0
$ns initial_node_pos $n15 20



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

#===================================
#        Agents Definition        
#===================================
#Setup a TCP connection
set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0
set sink15 [new Agent/TCPSink]
$ns attach-agent $n5 $sink15
$ns connect $tcp0 $sink15
$tcp0 set packetSize_ 1500

#Setup a TCP connection
set tcp1 [new Agent/TCP]
$ns attach-agent $n1 $tcp1
set sink16 [new Agent/TCPSink]
$ns attach-agent $n5 $sink16
$ns connect $tcp1 $sink16
$tcp1 set packetSize_ 1500

#Setup a TCP connection
set tcp2 [new Agent/TCP]
$ns attach-agent $n2 $tcp2
set sink17 [new Agent/TCPSink]
$ns attach-agent $n5 $sink17
$ns connect $tcp2 $sink17
$tcp2 set packetSize_ 1500

#Setup a TCP connection
set tcp3 [new Agent/TCP]
$ns attach-agent $n3 $tcp3
set sink18 [new Agent/TCPSink]
$ns attach-agent $n5 $sink18
$ns connect $tcp3 $sink18
$tcp3 set packetSize_ 1500

#Setup a TCP connection
set tcp4 [new Agent/TCP]
$ns attach-agent $n4 $tcp4
set sink19 [new Agent/TCPSink]
$ns attach-agent $n5 $sink19
$ns connect $tcp4 $sink19
$tcp4 set packetSize_ 1500

#Setup a TCP connection
set tcp5 [new Agent/TCP]
$ns attach-agent $n6 $tcp5
set sink20 [new Agent/TCPSink]
$ns attach-agent $n5 $sink20
$ns connect $tcp5 $sink20
$tcp5 set packetSize_ 1500

#Setup a TCP connection
set tcp6 [new Agent/TCP]
$ns attach-agent $n7 $tcp6
set sink21 [new Agent/TCPSink]
$ns attach-agent $n5 $sink21
$ns connect $tcp6 $sink21
$tcp6 set packetSize_ 1500

#Setup a TCP connection
set tcp7 [new Agent/TCP]
$ns attach-agent $n8 $tcp7
set sink22 [new Agent/TCPSink]
$ns attach-agent $n5 $sink22
$ns connect $tcp7 $sink22
$tcp7 set packetSize_ 1500

#Setup a TCP connection
set tcp8 [new Agent/TCP]
$ns attach-agent $n9 $tcp8
set sink23 [new Agent/TCPSink]
$ns attach-agent $n5 $sink23
$ns connect $tcp8 $sink23
$tcp8 set packetSize_ 1500

#Setup a TCP connection
set tcp9 [new Agent/TCP]
$ns attach-agent $n10 $tcp9
set sink24 [new Agent/TCPSink]
$ns attach-agent $n5 $sink24
$ns connect $tcp9 $sink24
$tcp9 set packetSize_ 1500

#Setup a TCP connection
set tcp10 [new Agent/TCP]
$ns attach-agent $n11 $tcp10
set sink25 [new Agent/TCPSink]
$ns attach-agent $n5 $sink25
$ns connect $tcp10 $sink25
$tcp10 set packetSize_ 1500

#Setup a TCP connection
set tcp11 [new Agent/TCP]
$ns attach-agent $n12 $tcp11
set sink26 [new Agent/TCPSink]
$ns attach-agent $n5 $sink26
$ns connect $tcp11 $sink26
$tcp11 set packetSize_ 1500

#Setup a TCP connection
set tcp12 [new Agent/TCP]
$ns attach-agent $n13 $tcp12
set sink27 [new Agent/TCPSink]
$ns attach-agent $n5 $sink27
$ns connect $tcp12 $sink27
$tcp12 set packetSize_ 1500

#Setup a TCP connection
set tcp13 [new Agent/TCP]
$ns attach-agent $n14 $tcp13
set sink28 [new Agent/TCPSink]
$ns attach-agent $n5 $sink28
$ns connect $tcp13 $sink28
$tcp13 set packetSize_ 1500

#Setup a TCP connection
set tcp14 [new Agent/TCP]
$ns attach-agent $n15 $tcp14
set sink29 [new Agent/TCPSink]
$ns attach-agent $n5 $sink29
$ns connect $tcp14 $sink29
$tcp14 set packetSize_ 1500

#Setup a TCP connection
set tcp14 [new Agent/TCP]
$ns attach-agent $n16 $tcp15
set sink29 [new Agent/TCPSink]
$ns attach-agent $n5 $sink29
$ns connect $tcp14 $sink29
$tcp14 set packetSize_ 1500


#===================================
#        Applications Definition  
set k [expr {11*pow(10, 6)}]
set elec [expr {pow(10, -12)}]
set eamp [expr {13*pow(10, -16)}]
set d1 [expr {50*1.414}]
set d2 50
set d3 25
set l1 [expr {0.0203*$d1}]
set l2 [expr {0.0203*$d2}] 
set l3 [expr {0.0203*$d3}] 
set count 0
      
#===================================
#Setup a FTP Application over TCP connection
set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ns at 1.0 "$ftp0 start"
$ns at 2.0 "$ftp0 stop"

#Setup a FTP Application over TCP connection
set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1
$ns at 2.0 "$ftp1 start"
$ns at 3.0 "$ftp1 stop"

#Setup a FTP Application over TCP connection
set ftp2 [new Application/FTP]
$ftp2 attach-agent $tcp2
$ns at 3.0 "$ftp2 start"
$ns at 4.0 "$ftp2 stop"

#Setup a FTP Application over TCP connection
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tcp3
$ns at 4.0 "$ftp3 start"
$ns at 5.0 "$ftp3 stop"

#Setup a FTP Application over TCP connection
set ftp4 [new Application/FTP]
$ftp4 attach-agent $tcp4
$ns at 5.0 "$ftp4 start"
$ns at 6.0 "$ftp4 stop"

#Setup a FTP Application over TCP connection
set ftp5 [new Application/FTP]
$ftp5 attach-agent $tcp5
$ns at 6.0 "$ftp5 start"
$ns at 7.0 "$ftp5 stop"

#Setup a FTP Application over TCP connection
set ftp6 [new Application/FTP]
$ftp6 attach-agent $tcp6
$ns at 7.0 "$ftp6 start"
$ns at 8.0 "$ftp6 stop"

#Setup a FTP Application over TCP connection
set ftp7 [new Application/FTP]
$ftp7 attach-agent $tcp7
$ns at 8.0 "$ftp7 start"
$ns at 9.0 "$ftp7 stop"

#Setup a FTP Application over TCP connection
set ftp8 [new Application/FTP]
$ftp8 attach-agent $tcp8
$ns at 9.0 "$ftp8 start"
$ns at 10.0 "$ftp8 stop"

#Setup a FTP Application over TCP connection
set ftp9 [new Application/FTP]
$ftp9 attach-agent $tcp9
$ns at 10.0 "$ftp9 start"
$ns at 11.0 "$ftp9 stop"

#Setup a FTP Application over TCP connection
set ftp11 [new Application/FTP]
$ftp11 attach-agent $tcp11
$ns at 12.0 "$ftp11 start"
$ns at 13.0 "$ftp11 stop"

#Setup a FTP Application over TCP connection
set ftp12 [new Application/FTP]
$ftp12 attach-agent $tcp12
$ns at 13.0 "$ftp12 start"
$ns at 14.0 "$ftp12 stop"

#Setup a FTP Application over TCP connection
set ftp13 [new Application/FTP]
$ftp13 attach-agent $tcp13
$ns at 14.0 "$ftp13 start"
$ns at 15.0 "$ftp13 stop"

#Setup a FTP Application over TCP connection
set ftp14 [new Application/FTP]
$ftp14 attach-agent $tcp14
$ns at 15.0 "$ftp14 start"
$ns at 16.0 "$ftp14 stop"

#Setup a FTP Application over TCP connection
set ftp15 [new Application/FTP]
$ftp15 attach-agent $tcp10
$ns at 11.0 "$ftp15 start"
$ns at 12.0 "$ftp15 stop"


#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam 11.4.16.1.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n$i reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
