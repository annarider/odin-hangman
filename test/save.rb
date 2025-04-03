# frozen_string_literal: true

# Tests the saving & loading of an existing
# Hangman game. It also tests correct
# serialization of data.
#
require 'yaml'
require_relative '../lib/game'
require_relative '../lib/state'
require_relative '../lib/board'

class Test
  GUESS = 'a'
  FILE_NAME = 'game-name1.txt'

  def self.setup
    game = Game.new
    game.board.track(GUESS)
    game.state.update(GUESS)
    puts "Original Secret word: #{game.board.word}"
    puts "Original guesses: #{game.state.guessed_letters}"
    game
  end
  
  def self.save(game)
    puts 'Testing save functionality:'
    saved = game.state.save(game.board, FILE_NAME)
    puts saved
    puts "Successful save? #{saved ? 'PASS' : 'FAIL'}"
  end
  
  def self.load(game)
    puts 'Testing load functionality:'
    loaded_game = Game.new
    loaded = loaded_game.state.load(FILE_NAME)
    puts "Loaded Secret word: #{loaded_game.board.word}"
    puts "Loaded guesses: #{loaded_game.state.guessed_letters}"
    puts "Successful load? #{loaded_game ? 'PASS' : 'FAIL'}"
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Test.setup
  Test.save(game)
  Test.load(game)
end
