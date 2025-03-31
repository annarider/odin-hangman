# frozen_string_literal: true

# main contains the main execution
# for the Hangman game.
#
require_relative 'lib/game'

loop do
  game = Game.new
  game.play
  puts 'Play again? Enter y for yes (y): '
  break unless gets.chomp.downcase == 'y'
end
