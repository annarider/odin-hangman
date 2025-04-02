# frozen_string_literal: true

# Ganme State class is responsible for 
# passively tracking the game's state 
# and prepping to save the game.
# It saves the state such as game_over and 
# guess history. It's also responsible for
# serializing & deserializing saved games.
#
# @example Create a new Game State
# state = State.new
class State

  NUMBER_OF_ROUNDS = 12

  attr_accessor :remaining_guesses, :guessed_letters

  def initialize
    @remaining_guesses = NUMBER_OF_ROUNDS
    @guessed_letters = ''
  end

  def game_over?(board)
    board.win? || @remaining_guesses == 0
  end

  def update(guess)
    @guessed_letters << guess
    @remaining_guesses -= 1
  end
end
