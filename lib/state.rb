# frozen_string_literal: true

# Game State class is responsible for
# passively tracking the game's state
# and prepping to save the game.
# It saves the state such as game_over and
# guess history. It's also responsible for
# serializing & deserializing saved games.
#
# @example Create a new Game State
# state = State.new
require 'yaml'

class State
  NUMBER_OF_ROUNDS = 12

  attr_accessor :remaining_guesses, :guessed_letters

  def initialize
    @remaining_guesses = NUMBER_OF_ROUNDS
    @guessed_letters = ''
  end

  def game_over?(board)
    board.win? || @remaining_guesses.zero?
  end

  def update(guess)
    @guessed_letters += guess
    @remaining_guesses -= 1
  end

  def save(board)
    data = serialize(board)
  end

  private

  def serialize(board)
    <<~GAME
    word: #{board.word}
    correct_guesses: #{board.correct_guesses}
    remaining_guesses: #{remaining_guesses}
    guessed_letters: #{guessed_letters}
    GAME
  end
end
