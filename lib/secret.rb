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
    dictionary = File.read(FILE_NAME).split
    dictionary.select { |word| word.length.between?(MIN_WORD_LENGTH, MAX_WORD_LENGTH) }.sample
  rescue Errno::ENOENT
    puts "Error: Dictionary file not found. Please check #{FILE_NAME}."
    exit(1) # Exit with error code
  rescue StandardError => e
    puts "Error reading dictionary file: #{e.message}"
    exit(1)
  end
end
