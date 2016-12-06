require_relative 'game'
require_relative 'linear_game'
require_relative 'oracle'
require_relative 'random_selection'
require_relative 'play_smart_random'
require_relative 'binary_search'
require_relative 'gamedriver'
NUM_OF_RUNS = 15
oracle = Oracle.new

ga = GameDriver.new(NUM_OF_RUNS ,oracle)
ga.play_template
