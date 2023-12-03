#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)
input     = File.read(file_path)

input
  .split("\n")
  .sum { |line| line.scan(/\d/).values_at(0, -1).join.to_i }
  .tap { puts _1 }