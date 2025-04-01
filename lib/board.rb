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
  
  attr_accessor :word, :guessed_letters, :correct_guesses

  def initialize(word = nil)
    @word = word
    @correct_guesses = '_' * @word.length
    @guessed_letters = ''
  end

  def win?
    @word == @correct_guesses
  end

  def track(guess)
    @guessed_letters << guess
    if word.include?(guess)
      correct(guess)
    else
      nil
    end
  end

  private 

  def correct(guess)
    letter_indices = []
    @word.chars.each_with_index do |letter, i|
      letter_indices << i if letter == guess
    end
    letter_indices
  end
end
