#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)
input     = File.read(file_path)

MAXIMUM_RED = 12
MAXIMUM_GREEN = 13
MAXIMUM_BLUE = 14

input
  .each_line
  .sum { |line|
    blue  = line.scan(/(\d+) blue/).flatten.map(&:to_i).max
    red   = line.scan(/(\d+) red/).flatten.map(&:to_i).max
    green = line.scan(/(\d+) green/).flatten.map(&:to_i).max

    if blue > MAXIMUM_BLUE || red > MAXIMUM_RED || green > MAXIMUM_GREEN
      0
    else
      line.scan(/Game (\d*)/).flatten.first.to_i
    end
  }
  .tap { puts _1 }

