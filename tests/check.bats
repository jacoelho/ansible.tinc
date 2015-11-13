#!/usr/bin/env bats

@test "tinc is installed and is in the PATH" {
  command -v tinc
}

