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
  
  attr_accessor :word, :guessed_letters, :current_letter

  def initialize(word = nil, current_letter = nil)
    @word = word
    @guessed_letters = '_' * @word.length
    @current_letter = current_letter
  end

  def win?
    @word == @guessed_letters
  end

  def feedback
    false
  end
end
