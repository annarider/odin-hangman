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
  
  attr_accessor :word, :guessed_letters

  def initialize(word = nil)
    @word = word
    @guessed_letters = '_' * @word.length
  end

  def win?
    @word == @guessed_letters
  end

  def track(guess)
    @guessed_letters << guess
    feedback(guess)
  end

  private 

  def feedback(guess)
    if word.include?(guess)
      correct_guess
    else
      incorrect_guess
    end
  end

  def correct_guess
  end
end
