require_relative 'bowling'
require_relative 'frame'
# Bowling constructor get parameter from terminal in this format "3 3 3 3 3 1"

test = Bowling.new("9 1 9 1 7")
puts test.moves()