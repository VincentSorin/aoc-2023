#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)
input     = File.read(file_path)

def part1(input)
  numbers = []
  input
    .split("\n")
    .each_with_index do |line, line_number|
      line.scan(/\d+/) do |number|
        numbers << number if had_symbol_around(input.split("\n"), line_number, $~.offset(0))
      end
    end
  numbers.map(&:to_i).sum
end

def had_symbol_around(input, line_number, offset)
  # offset for width
  min_offset = [offset[0] - 1, 0].max
  max_offset = [offset[1] + 1, input[line_number].length].min - 1
  # offset for height
  min_line = [line_number - 1, 0].max
  max_line = [line_number + 1, input.length - 1].min
  
  (min_line..max_line).each do |current_index|
    input[current_index][min_offset..max_offset].each_char do |char|
      return true if char&.match?(/[^.\d]/)
    end
  end
  
  false 
end

puts part1(input)