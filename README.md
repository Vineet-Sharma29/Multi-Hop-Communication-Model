# Multi-Hop-Communication-Model
A multi-hop communication model simulated in NS2 / NS3 for underwater RF communication.

Following are implemented for simulating the model:-
* First a 100*100 square field consisting of a network cluster under the sea bed is assumed.
* Assume n number of nodes inside the field in such a way that n belongs to {4, 9, 16, 25}. These collection of nodes is called a cluster.
* Assign a cluster head to one amongst all the nodes. The node which is at minimum distance from the base station is chosen as the cluster head.
* All these nodes have are assigned various attributes such as node position(symmetric distribution in 100x100 space ), data rate ( varied in the range belonging to {0.1Mbps, 0.5Mbps, 1Mbps, 11Mbps} ), initial energy( { child nodes are assigned 1J of energy and cluster head is assigned sufficient energy to survive till the end of the life of network} ).
* Assume that there is base station at the top of the square field exactly above the middle point of the cluster.
* Data by child nodes will be first communicated to cluster head and then to base station
* Links are established between nodes and cluster head and data is sent over those links from nodes to cluster head using TDMA protocol. We measure the network life for different number of nodes keeping the data rate constant. For this we calculate the energy consumed for each transmission and reduce the energy of the nodes after each transmission
* For each set of nodes we also measure the network life varying the data rate. In this case the number of nodes is constant.
* Calculate the network life by increasing the dimensions of the field to 200*200 and keeping the previous parameters.
* Observe the network life for by varying the different parameters.
## Simulation tools

NS-3 is used to simulate various types of network topologies and communication across it. NS2 is another tool which is used for simulation ,however for this project NS-3 will be used. It is based on C++. The process of network involves following steps:-
* Create nodes 
* Attach channel with node
* Install protocol stack
* Assign IP address
* Install application

Final result can be visualised using NetAnim library.


## Results

> Network life for a given distance against number of nodes

| Number of Nodes | Network Life for d = 100 | Network Life for d = 200
|-----------------|--------------------------|-------------------------|
|4|910|31|
|9|9121|910|
|16|19102|2265|
|25|35691|9121|

![Network life for a given distance against number of nodes](https://github.com/Vineet-Sharma29/Multi-Hop-Communication-Model/blob/master/docs/1.0.png)


> Network life for a 2-cluster network for different data rates(K)

| Data Rate(in Mbps) | Network Life |
| ------------------ | ------------ |
| K = 0.1 | 100017 |
| K = 0.5 | 20004 |
| K = 1 | 10002 |
| K = 11 | 910 |

![Network life for a 2-cluster network for different data rates(K)](https://github.com/Vineet-Sharma29/Multi-Hop-Communication-Model/blob/master/docs/2.png)




> Network life when number of node (N) and data rate are varied

| | 0.1 Mbps | 0.5 Mbps | 1 Mbps | 11Mbps |
|-|----------|----------|--------|--------|
|N = 4|100017|20004|10002|910|
|N = 9|954538|213674|98565|9121|
|N = 16|1716443|428751|210094|19102|
|N = 25|43578304|840223|424353|35691|

![Network life when number of node (N) and data rate are varied](https://github.com/Vineet-Sharma29/Multi-Hop-Communication-Model/blob/master/docs/3.0.png)

## Inference

From the above set of study and observations, it can be seen that on increasing the number of nodes in
the cluster, the individual energy consumed by each node becomes less and thus the network life
increases exponentially. Also, when the overall perimeter of the cluster network increases, the network
life decreases because the distance between the nodes increases, which in turn takes more energy to
transfer the data. Also the network life decreases exponentially when the data rate increases.

