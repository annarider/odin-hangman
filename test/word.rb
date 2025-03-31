# frozen_string_literal: true

# Test word contains scripts to
# test word class for the Hangman game.
# Tests include randomly picking a
# word, reading from the dictionary.
#
require_relative '../lib/word'

# test 1 word
word_obj = Word.new
p "Word object initialized: #{word_obj ? 'PASS' : 'FAIL'}"

# test 10 words
10.times do |i|
  chosen_word = word_obj.word
  p "Test #{i + 1}: Word = #{chosen_word}, length = #{chosen_word.length}"
  p "Length between min & max lengths #{chosen_word.length.between?(Word::MIN_WORD_LENGTH, Word::MAX_WORD_LENGTH)}"
end
