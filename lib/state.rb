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
  attr_accessor :remaining_guesses, :guessed_letters, :game_over, :winner

  def initialize(rounds = 0)
    @remaining_guesses = rounds
    @guessed_letters = []
    @game_over = false
    @winner = false
  end
end
