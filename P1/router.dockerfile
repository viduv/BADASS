FROM frrouting/frr

ADD daemons /etc/frr/daemons

CMD ["/usr/lib/frr/watchfrr", "zebra", "ospfd", "bgpd"]
