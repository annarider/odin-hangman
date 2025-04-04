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
    serialized_data = YAML.dump(format(board))
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
    file_name = "saved_games/#{name}.txt"
    File.open(file_name, 'w') do |file|
      file.puts serialized_data
    end
  end

  def load(name)
    serialized_yaml = File.read("./saved_games/#{name}.txt")
    game_data = YAML.load(serialized_yaml)
    game_data
  end

  private

  def format(board)
    <<~GAME
    word: #{board.word}
    correct_guesses: #{board.correct_guesses}
    remaining_guesses: #{remaining_guesses}
    guessed_letters: #{guessed_letters}
    GAME
  end
end
