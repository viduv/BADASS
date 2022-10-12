# Creation des bridge sur les routeurs
ip link add br0 type bridge
# Lance le bridge br0
ip link set dev br0 up
# Cree l'adresse sur le device eth0
ip addr add 10.1.1.1/24 dev eth0
ip addr add 10.1.1.2/24 dev eth0
#Permet de visualiser la nouvelle addresse
ip addr show eth0
#Permet de creer le vxlan
ip link add name vxlan10 type vxlan id 10 dev eth0 remote 10.1.1.2 local 10.1.1.1 dstport 4789
ip link add name vxlan10 type vxlan id 10 dev eth0 remote 10.1.1.1 local 10.1.1.2 dstport 4789
# Ajoute une addresse au vxlan
ip addr add 20.1.1.1/24 dev vxlan10
ip addr add 20.1.1.2/24 dev vxlan10
# Permet de visualiser l'etat du vxlan
ip -d link show vxlan10
# Ajoute le device eth1 au bridge
brctl addif br0 eth1
# Ajoute le vxlan au bridge
brctl addif br0 vxlan10
# Lance le vxlan
ip link set dev vxlan10 up
# On vois que le vxlan est UP
ip link show vxlan10

# Sur les host
ip addr add 30.1.1.1/24 dev eth1


# MULTI CAST
ip link add br0 type bridge
ip link set dev br0 up

ip addr add 10.1.1.1/24 dev eth0
ip addr add 10.1.1.2/24 dev eth0

ip addr show eth0

ip link add name vxlan10 type vxlan id 10 dev eth0 group 239.1.1.1 dstport 4789

ip addr add 20.1.1.1/24 dev vxlan10
ip addr add 20.1.1.2/24 dev vxlan10

brctl addif br0 eth1
brctl addif br0 vxlan10
ip link set dev vxlan10 up
