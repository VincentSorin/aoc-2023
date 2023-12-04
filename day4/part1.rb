#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)
input     = File.read(file_path)

input
  .split("\n")
  .sum do |card|
    winning_cards = card.split(':')[1].split('|')[0].split(' ').map(&:to_i)
    owned_cards = card.split(':')[1].split('|')[1].split(' ').map(&:to_i)
    (2 ** ((winning_cards & owned_cards).length - 1)).floor
  end.tap { puts _1 }