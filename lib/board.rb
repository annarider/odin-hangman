# frozen_string_literal: true

# Board controls the game rules
# for the Hangman game. Its duties
# include validating guesses and
# providing feedback.
#
# @example Create a new Board 
# board = Board.new
class Board
  require_relative 'secret'

  NUMBER_OF_ROUNDS = 12
  
  attr_accessor :word, :guess_history, :current_letter

  def initialize(word = nil, current_guess = nil)
    @word = word
    @guess_history = '_' * @word.length
    @current_letter = current_guess
  end

  def win?
    false
  end

  def game_over?
    false
  end

  def feedback
    false
  end
end
