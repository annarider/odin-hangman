# frozen_string_literal: true

# Test word contains scripts to
# test word class for the Hangman game.
# Tests include randomly picking a
# word, reading from the dictionary.
#
require_relative '../lib/secret'

# test 1 word
secret = Secret.new
p "Secret object initialized: #{secret ? 'PASS' : 'FAIL'}"

# test 10 words
10.times do |i|
  word = Secret.new
  chosen_word = word.word
  p "Test #{i + 1}: Word = #{chosen_word}, length = #{chosen_word.length}"
  p "Length between min & max lengths #{chosen_word.length.between?(Secret::MIN_WORD_LENGTH, Secret::MAX_WORD_LENGTH)}"
end
