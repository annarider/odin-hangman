# frozen_string_literal: true

# Word class manages choosing
# a word from the dictionary
# and making sure it meets
# the length requirements.
#
# @example Creating a new word object
# word = Word.new
class Word
  MIN_WORD_LENGTH = 5
  MAX_WORD_LENGTH = 12

  attr_accessor :dictionary, :word 

  def initialize
    
  end
end
