#!/usr/bin/env bats

@test "tinc is installed and is in the PATH" {
  command -v tincd
}

@test "tinc nets.boot" {
  [ -e "/etc/tinc/nets.boot" ]
}

@test "tinc tinc.conf" {
  [ -e "/etc/tinc/test_vpn/tinc.conf" ]
}

@test "tinc rsa_key.priv" {
  [ -e "/etc/tinc/test_vpn/rsa_key.priv" ]
}
