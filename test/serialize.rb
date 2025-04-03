# frozen_string_literal: true

# Test serialization
# for the Hangman game.
#
require 'yaml'
require_relative '../lib/board'
require_relative '../lib/state'

class Test
  WORD = 'sails'

  def self.serialize
    board = Board.new(WORD)
    state = State.new
    board.correct_guesses = 'a'
    state.guessed_letters = 'a'
    state.remaining_guesses = 11

    puts state.save(board)
  end
end

if __FILE__ == $PROGRAM_NAME
  Test.serialize
end
