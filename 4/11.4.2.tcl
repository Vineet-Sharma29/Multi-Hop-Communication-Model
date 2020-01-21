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
set val(nn)     5                          ;# number of mobilenodes
set val(rp)     DSDV                       ;# routing protocol
set val(x)      225                      ;# X dimension of topography
set val(y)      100                      ;# Y dimension of topography
set val(stop)   7.0                         ;# time of simulation end

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
set tracefile [open 11.4.2.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open 11.4.2.nam w]
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
#Create 5 nodes
$ns node-config -initialEnergy 1
set n0 [$ns node]
$n0 set X_ 0
$n0 set Y_ 100
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20

$ns node-config -initialEnergy 1
set n1 [$ns node]
$n1 set X_ 100
$n1 set Y_ 100
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20


$ns node-config -initialEnergy 1
set n2 [$ns node]
$n2 set X_ 0
$n2 set Y_ 0
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20



$ns node-config -initialEnergy 3
set n3 [$ns node]
$n3 set X_ 100
$n3 set Y_ 0
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20



$ns node-config -initialEnergy 3
set n4 [$ns node]
$n4 set X_ 50
$n4 set Y_ 50
$n4 set Z_ 0.0
$ns initial_node_pos $n4 20



set en0 [$n0 energy]
set en1 [$n1 energy]
set en2 [$n2 energy]
set en3 [$n3 energy]
set en4 [$n4 energy]


#===================================
#        Agents Definition        
#===================================
#Setup a TCP connection
set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0
set sink3 [new Agent/TCPSink]
$ns attach-agent $n1 $sink3
$ns connect $tcp0 $sink3
$tcp0 set packetSize_ 1500

#Setup a TCP connection
set tcp1 [new Agent/TCP]
$ns attach-agent $n2 $tcp1
set sink4 [new Agent/TCPSink]
$ns attach-agent $n1 $sink4
$ns connect $tcp1 $sink4
$tcp1 set packetSize_ 1500

#Setup a TCP connection
set tcp2 [new Agent/TCP]
$ns attach-agent $n3 $tcp2
set sink5 [new Agent/TCPSink]
$ns attach-agent $n1 $sink5
$ns connect $tcp2 $sink5
$tcp2 set packetSize_ 1500

#Setup a TCP connection
set tcp7 [new Agent/TCP]
$ns attach-agent $n1 $tcp7
set sink6 [new Agent/TCPSink]
$ns attach-agent $n4 $sink6
$ns connect $tcp7 $sink6
$tcp7 set packetSize_ 1500


#===================================
#        Applications Definition        
#===================================

set l1 [expr {0.0203*100}]
set k [expr {11*pow(10, 6)}]
set elec [expr {pow(10, -12)}]
set eamp [expr {13*pow(10, -16)}]
set count 0

while { $en0 > 0 || $en1 > 0 || $en2 > 0 && $en3 > 0 } {
	#Setup a FTP Application over TCP connection
	set ftp0 [new Application/FTP]
	$ftp0 attach-agent $tcp0
	$ns at 1.0 "$ftp0 start"
	$ns at 2.0 "$ftp0 stop"
	set etx0 [expr { $k*$elec + $k*pow(100,2)*$eamp*exp($l1) }]
	set en0 [expr { $en0 - $etx0 }]


	#Setup a FTP Application over TCP connection
	set ftp1 [new Application/FTP]
	$ftp1 attach-agent $tcp1
	$ns at 2.0 "$ftp1 start"
	$ns at 3.0 "$ftp1 stop"
	set l2 [expr {0.0203*100*1.414}]
	set etx1 [expr {  $k*$elec + $k*pow(100,2)*2*$eamp*exp($l2) }]
	set en1 [expr { $en1 - $etx1 }]


	#Setup a FTP Application over TCP connection
	set ftp2 [new Application/FTP]
	$ftp2 attach-agent $tcp2
	$ns at 3.0 "$ftp2 start"
	$ns at 4.0 "$ftp2 stop"
	set etx2 [expr {  $k*$elec + $k*pow(100,2)*$eamp*exp($l1) }]
	set en2 [expr { $en2 - $etx2 }]


	#Setup a FTP Application over TCP connection
	set ftp3 [new Application/FTP]
	$ftp3 attach-agent $tcp7
	$ns at 4.0 "$ftp3 start"
	$ns at 5.0 "$ftp3 stop"
	set l3 [expr {0.0203*75}]
	set etx3 [expr {  3*$k*$elec + 3*$k*pow(75,2)*$eamp*exp($l3) + 3*$k*pow(10, -12) }]
	set en3 [expr { $en3 - $etx3 }]

	set count [expr { $count + 1 }]
	puts stdout "Node0 $en0"
	puts stdout "Node1 $en1"
	puts stdout "Node2 $en2"
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
    exec nam 11.4.2.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n$i reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
