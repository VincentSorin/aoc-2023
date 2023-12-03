#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)
input     = File.read(file_path)

def part1(input)
  numbers = []
  input
    .split("\n")
    .each_with_index do |line, index|
      line.scan(/\d+/) do |number|
        offset = $~.offset(0)
        if had_symbol_around(input.split("\n"), index, offset)
          numbers << number
        end
      end
    end
  numbers.map(&:to_i).sum
end

def had_symbol_around(input, index, offset)
  # offset for width
  min_offset = [offset[0] - 1, 0].max
  max_offset = [offset[1] + 1, input[index].length].min - 1
  # offset for height
  min_index = [index - 1, 0].max
  max_index = [index + 1, input.length - 1].min
  
  (min_index..max_index).each do |current_index|
    input[current_index][min_offset..max_offset].each_char do |char|
      return true if char&.match?(/[^#{%w[. 1 2 3 4 5 6 7 8 9 0].join}]/)
    end
  end
  
  false 
end

puts part1(input)