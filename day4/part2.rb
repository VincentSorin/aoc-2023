#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)
input     = File.read(file_path)

line = input.split("\n")
copies_list = line.each_with_index.to_h {|_, gameNumber| [gameNumber, 1]}
line.map.with_index do |line, index|
  winning_cards = line.split(':')[1].split('|')[0].split(' ').map(&:to_i)
  owned_cards = line.split(':')[1].split('|')[1].split(' ').map(&:to_i)
  for i in index + 1..index + ((winning_cards & owned_cards).length)
    copies_list[i] += copies_list[index]
  end
  copies_list[index]
end
.sum
.tap { puts _1 }
