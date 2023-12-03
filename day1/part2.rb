#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)
input     = File.read(file_path)

SEARCH_TOKENS = {"one"=>1, "two"=>2, "three"=>3, "four"=>4, "five"=>5, "six"=>6, "seven"=>7, "eight"=>8, "nine"=>9}

input
  .split("\n")
  .sum { |line| 
      line.scan(/(?=(#{SEARCH_TOKENS.keys.join("|")}|\d))/)
      .flatten.values_at(0, -1)
      .map { |match| SEARCH_TOKENS[match] || match }.join.to_i
  }
  .tap { puts _1 }

