#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)
input     = File.read(file_path)

input
  .each_line
  .sum { |line|
    red   = line.scan(/(\d+) red/).flatten.map(&:to_i).max
    green = line.scan(/(\d+) green/).flatten.map(&:to_i).max
    blue  = line.scan(/(\d+) blue/).flatten.map(&:to_i).max

    red * green * blue
  }
  .tap { puts _1 }

