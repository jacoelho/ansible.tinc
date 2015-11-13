jacoelho.tinc
=========

An ansible role that installs tinc on Ubuntu.

Tested on ubuntu 14.04 (Trusty)

Role Variables
--------------

Each tinc configuration is mapped to a variable (see `defaults/main.yml`)

Dependencies
------------

python module netaddr


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
