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
set val(nn)     10                         ;# number of mobilenodes
set val(rp)     DSDV                       ;# routing protocol
set val(x)      281                      ;# X dimension of topography
set val(y)      100                      ;# Y dimension of topography
set val(stop)   11.0                         ;# time of simulation end

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
set tracefile [open 11.4.9.1.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open 11.4.9.1.nam w]
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
#Create 10 nodes
$ns node-config -initialEnergy 1
set n0 [$ns node]
$n0 set X_ 0
$n0 set Y_ 100
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20

$ns node-config -initialEnergy 1
set n1 [$ns node]
$n1 set X_ 50
$n1 set Y_ 100
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20



$ns node-config -initialEnergy 1
set n2 [$ns node]
$n2 set X_ 100
$n2 set Y_ 100
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20



$ns node-config -initialEnergy 1
set n3 [$ns node]
$n3 set X_ 0
$n3 set Y_ 50
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20



$ns node-config -initialEnergy 8
set n4 [$ns node]
$n4 set X_ 50
$n4 set Y_ 50
$n4 set Z_ 0.0
$ns initial_node_pos $n4 20



$ns node-config -initialEnergy 1
set n5 [$ns node]
$n5 set X_ 100
$n5 set Y_ 50
$n5 set Z_ 0.0
$ns initial_node_pos $n5 20



$ns node-config -initialEnergy 1
set n6 [$ns node]
$n6 set X_ 0
$n6 set Y_ 0
$n6 set Z_ 0.0
$ns initial_node_pos $n6 20



$ns node-config -initialEnergy 1
set n7 [$ns node]
$n7 set X_ 50
$n7 set Y_ 0
$n7 set Z_ 0.0
$ns initial_node_pos $n7 20




$ns node-config -initialEnergy 1
set n8 [$ns node]
$n8 set X_ 100
$n8 set Y_ 0
$n8 set Z_ 0.0
$ns initial_node_pos $n8 20



$ns node-config -initialEnergy 8
set n9 [$ns node]
$n9 set X_ 49
$n9 set Y_ 49
$n9 set Z_ 0.0
$ns initial_node_pos $n9 20


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

#===================================
#        Agents Definition        
#===================================
#Setup a TCP connection
set tcp8 [new Agent/TCP]
$ns attach-agent $n0 $tcp8
set sink16 [new Agent/TCPSink]
$ns attach-agent $n4 $sink16
$ns connect $tcp8 $sink16
$tcp8 set packetSize_ 1500

#Setup a TCP connection
set tcp9 [new Agent/TCP]
$ns attach-agent $n1 $tcp9
set sink17 [new Agent/TCPSink]
$ns attach-agent $n4 $sink17
$ns connect $tcp9 $sink17
$tcp9 set packetSize_ 1500

#Setup a TCP connection
set tcp10 [new Agent/TCP]
$ns attach-agent $n2 $tcp10
set sink18 [new Agent/TCPSink]
$ns attach-agent $n4 $sink18
$ns connect $tcp10 $sink18
$tcp10 set packetSize_ 1500

#Setup a TCP connection
set tcp11 [new Agent/TCP]
$ns attach-agent $n5 $tcp11
set sink19 [new Agent/TCPSink]
$ns attach-agent $n4 $sink19
$ns connect $tcp11 $sink19
$tcp11 set packetSize_ 1500

#Setup a TCP connection
set tcp12 [new Agent/TCP]
$ns attach-agent $n8 $tcp12
set sink20 [new Agent/TCPSink]
$ns attach-agent $n4 $sink20
$ns connect $tcp12 $sink20
$tcp12 set packetSize_ 1500

#Setup a TCP connection
set tcp13 [new Agent/TCP]
$ns attach-agent $n7 $tcp13
set sink21 [new Agent/TCPSink]
$ns attach-agent $n4 $sink21
$ns connect $tcp13 $sink21
$tcp13 set packetSize_ 1500

#Setup a TCP connection
set tcp14 [new Agent/TCP]
$ns attach-agent $n6 $tcp14
set sink22 [new Agent/TCPSink]
$ns attach-agent $n4 $sink22
$ns connect $tcp14 $sink22
$tcp14 set packetSize_ 1500

#Setup a TCP connection
set tcp15 [new Agent/TCP]
$ns attach-agent $n3 $tcp15
set sink23 [new Agent/TCPSink]
$ns attach-agent $n4 $sink23
$ns connect $tcp15 $sink23
$tcp15 set packetSize_ 1500

#Setup a TCP connection
set tcp25 [new Agent/TCP]
$ns attach-agent $n4 $tcp25
set sink26 [new Agent/TCPSink]
$ns attach-agent $n9 $sink26
$ns connect $tcp25 $sink26
$tcp25 set packetSize_ 1500


#===================================
#        Applications Definition        
#===================================
#Setup a FTP Application over TCP connection
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


while { $en0 > 0 || $en1 > 0 || $en2 > 0 && $en3 > 0 || $en5 > 0 || $en6 > 0 && $en7 > 0 && $en8 > 0 } {

	set ftp0 [new Application/FTP]
	$ftp0 attach-agent $tcp8
	$ns at 1.0 "$ftp0 start"
	$ns at 2.0 "$ftp0 stop"
	set etx0 [expr { $k*$elec + $k*pow(50,2)*2*$eamp*exp($l1) }]
	set en0 [expr { $en0 - $etx0 }]


	#Setup a FTP Application over TCP connection
	set ftp1 [new Application/FTP]
	$ftp1 attach-agent $tcp9
	$ns at 2.0 "$ftp1 start"
	$ns at 3.0 "$ftp1 stop"
	set etx1 [expr { $k*$elec + $k*pow(50,2)*$eamp*exp($l2) }]
	set en1 [expr { $en1 - $etx1 }]


	#Setup a FTP Application over TCP connection
	set ftp3 [new Application/FTP]
	$ftp3 attach-agent $tcp11
	$ns at 4.0 "$ftp3 start"
	$ns at 5.0 "$ftp3 stop"
	set etx5 [expr { $k*$elec + $k*pow(50,2)*$eamp*exp($l2) }]
	set en5 [expr { $en5 - $etx5 }]

	#Setup a FTP Application over TCP connection
	set ftp4 [new Application/FTP]
	$ftp4 attach-agent $tcp12
	$ns at 5.0 "$ftp4 start"
	$ns at 6.0 "$ftp4 stop"
	set etx8 [expr { $k*$elec + $k*pow(50,2)*2*$eamp*exp($l1) }]
	set en8 [expr { $en8 - $etx8 }]



	#Setup a FTP Application over TCP connection
	set ftp5 [new Application/FTP]
	$ftp5 attach-agent $tcp13
	$ns at 6.0 "$ftp5 start"
	$ns at 7.0 "$ftp5 stop"
	set etx7 [expr { $k*$elec + $k*pow(50,2)*$eamp*exp($l2) }]
	set en7 [expr { $en7 - $etx7 }]



	#Setup a FTP Application over TCP connection
	set ftp6 [new Application/FTP]
	$ftp6 attach-agent $tcp14
	$ns at 7.0 "$ftp6 start"
	$ns at 8.0 "$ftp6 stop"
	set etx6 [expr { $k*$elec + $k*pow(50,2)*2*$eamp*exp($l1) }]
	set en6 [expr { $en6 - $etx6 }]




	#Setup a FTP Application over TCP connection
	set ftp7 [new Application/FTP]
	$ftp7 attach-agent $tcp15
	$ns at 8.0 "$ftp7 start"
	$ns at 9.0 "$ftp7 stop"
	set etx3 [expr { $k*$elec + $k*pow(50,2)*$eamp*exp($l2) }]
	set en3 [expr { $en3 - $etx3 }]




	#Setup a FTP Application over TCP connection
	set ftp8 [new Application/FTP]
	$ftp8 attach-agent $tcp10
	$ns at 3.0 "$ftp8 start"
	$ns at 4.0 "$ftp8 stop"
	set etx2 [expr { $k*$elec + $k*pow(50,2)*2*$eamp*exp($l1) }]
	set en2 [expr { $en2 - $etx2 }]



	#Setup a FTP Application over TCP connection
	set ftp9 [new Application/FTP]
	$ftp9 attach-agent $tcp25
	$ns at 9.0 "$ftp9 start"
	$ns at 10.0 "$ftp9 stop"
	set etx4 [expr {  8*$k*$elec + 8*$k*pow(25,2)*$eamp*exp($l3) + 8*$k*pow(10, -12) }]
	set en4 [expr { $en4 - $etx4 }]

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
    exec nam 11.4.9.1.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n$i reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
