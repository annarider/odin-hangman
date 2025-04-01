# frozen_string_literal: true

# Secret class manages choosing
# a word from the dictionary
# and making sure it meets
# the length requirements.
#
# @example Creating a new word object
# word = Secret.new
class Secret
  MIN_WORD_LENGTH = 5
  MAX_WORD_LENGTH = 12
  FILE_NAME = 'google-10000-english-no-swears.txt'

  attr_accessor :dictionary, :word 

  def self.pick_word
    @dictionary = File.read(FILE_NAME).split
    @word = @dictionary.select { |word| word.length.between?(MIN_WORD_LENGTH, MAX_WORD_LENGTH)}.sample
  end
end
