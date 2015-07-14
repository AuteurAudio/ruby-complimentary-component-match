# A Ruby Complimentary Component Value Matcher
# Copyright (c) 2015, Colin Shaw
# Distributed under the terms of the MIT License

require 'csv'
require './src/match.rb'

filename  = ARGV[0]
threshold = Float(ARGV[1])
a, b      = [], []

CSV.foreach(filename) do |r|
    a << Float(r[0]) unless r[0].nil?
    b << Float(r[1]) unless r[1].nil?
end

Match.new(a,b).match(threshold).report
