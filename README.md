jacoelho.tinc
=========

An ansible role that installs tinc on Ubuntu.

Tested on ubuntu 14.04 (Trusty), Fedora 24, CentOS7 and RHEL7.

Tested for L2 mesh ('switch' mode, the default for this role) and routed setup
('router' mode).

Role Variables
--------------

Each tinc configuration is mapped to a variable (see `defaults/main.yml`)

Generate an tincd key on each host participating in the VPN:

    tincd -n test -K4096

With this information set ```tinc_rsa_key``` in host-specific configuration.

In order to setup a simple point to point vpn, common variables:

    tinc_vpn:
      - vpn: test #vpn name
        name: host1
        address: 192.168.205.10 #local adddress
        vpn_address: 172.10.10.10 # ip address to use in the vpn interface
        vpn_prefixlength: 24 # tells which hosts in VPN are directly reachable
        public_key: |
          -----BEGIN RSA PUBLIC KEY-----
          -----END RSA PUBLIC KEY-----
      - vpn: test
        name: host2
        address: 192.168.205.11
        vpn_address: 172.10.10.11
        vpn_prefixlength: 24
        public_key: |
          -----BEGIN RSA PUBLIC KEY-----
          -----END RSA PUBLIC KEY-----

Host-specific configuration:

host1:

    tinc_hostname: host1
    tinc_rsa_key: |
      -----BEGIN RSA PRIVATE KEY-----
      -----END RSA PRIVATE KEY-----

host2:

    tinc_hostname: host2
    tinc_rsa_key: |
      -----BEGIN RSA PRIVATE KEY-----
      -----END RSA PRIVATE KEY-----

More Complicated Networks
-------------------------
If you have a more complicated network, such as where each node in the
mesh is not fully connected, or where a node has additional hosts behind it,
you can set the 'subnet' value for each element in tinc_vpn. This will be
passed directly to the Subnet field in that host's configuration file. If
subnet is not specified, it will be set to:

{{vpn_address}}/32

which tells tinc that each host on the VPN can be contacted directly, which is the
simplest configuration.

Switch vs Router Mode
---------------------

To use a routed configuration rather than an L2 configuration, add this
to each block of tinc_vpn:

    mode: router

If mode is not set, it defaults to "switch". See the tinc documentation
for more details on the difference between switch and router mode.

Example Playbook
----------------

    - hosts: servers
      roles:
        - { role: jacoelho.tinc }

License
-------

BSD

Author Information
------------------

This role was created in 2015 by [José Coelho](https://github.com/jacoelho)
