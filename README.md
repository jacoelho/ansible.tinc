jacoelho.tinc
=========

An ansible role that installs tinc on Ubuntu.

Tested on ubuntu 14.04 (Trusty)

Only tested for L2 mesh setup.

Role Variables
--------------

Each tinc configuration is mapped to a variable (see `defaults/main.yml`)

Generate an tincd key:

    tincd -n test -K4096

With this information set ```tinc_rsa_key```

In order to setup a simple point to point vpn:

common variables:
  
    tinc_vpn:
      - vpn: test #vpn name 
        name: host1  
        bind: 192.168.205.10 #local adddress 
        port: 655
        compression: 0
        address: 172.10.10.10/24 # ip address to use in the vpn interface
        public_key: |
          -----BEGIN RSA PUBLIC KEY-----
          -----END RSA PUBLIC KEY-----
      - vpn: test
        name: host2 
        bind: 192.168.205.11
        port: 655
        compression: 0
        address: 172.10.10.11/24
        public_key: |
          -----BEGIN RSA PUBLIC KEY-----
          -----END RSA PUBLIC KEY-----

host1:

    tinc_hostname: host1

host2:

    tinc_hostname: host1

Dependencies
------------

python module netaddr is needed where playbook is going to run.


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
