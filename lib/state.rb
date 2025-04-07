# frozen_string_literal: true

# Game State class is responsible for
# passively tracking the game's state
# and prepping to save the game.
# It saves the state such as game_over and
# guess history. It's also responsible for
# serializing & deserializing saved games.
#
# @example Create a new Game State
# state = State.new
require 'yaml'

class State
  NUMBER_OF_ROUNDS = 12

  attr_accessor :remaining_guesses, :guessed_letters

  def initialize
    @remaining_guesses = NUMBER_OF_ROUNDS
    @guessed_letters = ''
  end

  def game_over?(board)
    board.win? || @remaining_guesses.zero?
  end

  def update(guess)
    @guessed_letters += guess
    @remaining_guesses -= 1
  end

  def save(board, name)
    serialized_yaml = YAML.dump(format(board))
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
    file_name = "saved_games/#{name}.txt"
    File.write(file_name, serialized_yaml)
  rescue IOError
    puts "Error: Couldn't save the game"
  rescue StandardError => e
    puts "Error saving the game. Error message: #{e.message}"
    exit(1)
  end

  def load(name)
    if name
      s = YAML.load_file("./saved_games/#{name}.txt")
      p s.is_a?(Hash)
      s
    end
  rescue Errno::ENOENT
    puts "Error: Game file not found. Please check #{name}."
    puts "Let's play a new game instead."
  rescue StandardError => e
    puts "Error reading saved game: #{e.message}"
    puts "Let's play a new game instead."
  end

  private

  def format(board)
    {
      word: board.word,
      correct_guesses: board.correct_guesses,
      remaining_guesses: remaining_guesses,
      guessed_letters: guessed_letters
      }
  end
end
