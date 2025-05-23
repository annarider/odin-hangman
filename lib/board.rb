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

  attr_accessor :word, :correct_guesses

  def initialize(word = nil)
    @word = word
    @correct_guesses = '_' * @word.length
    @guessed_letters = ''
  end

  def win?
    @word == @correct_guesses
  end

  def track(guess)
    return unless word.include?(guess)

    correct(guess)
  end

  private

  def correct(guess)
    letter_indices = []
    @word.chars.each_with_index do |letter, i|
      letter_indices << i if letter == guess
    end
    update_correct_guesses(guess, letter_indices)
    letter_indices
  end

  def update_correct_guesses(guess, indices)
    indices.each do |i|
      @correct_guesses[i] = guess
    end
  end
end
