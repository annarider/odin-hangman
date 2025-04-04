# frozen_string_literal: true

# Game class is the controller
# responsible for actively managing the game.
# It initializes the game objects, such as
# interface and board, prompts the objects
# to perform actions.
#
# @example Create a new Game
# game = Game.new
class Game
  require_relative 'secret'
  require_relative 'interface'
  require_relative 'board'
  require_relative 'state'

  attr_accessor :word, :board, :state, :interface

  def initialize
    @word = Secret.pick_word
    @interface = Interface.new
    @board = Board.new(@word)
    @state = State.new
  end

  def play
    game_name = interface.welcome
    loaded_game @state.load(game_name)
    launch(loaded_game) if loaded_game
    loop do
      play_turn
      interface.show_board(state)
      break if state.game_over?(board)
    end
    announce_end
  end

  private

  def play_turn
    guess = interface.guess(board, state)
    board.track(guess)
    state.update(guess)
  end

  def announce_end
    puts "The secret word was: #{board.word}"
    if board.win?
      interface.announce_win
    else
      interface.announce_lose
    end
  end

  def launch(game)
    board.word = game[:word]
    board.correct_guesses = game[:correct_guesses]
    state.remaining_guesses = game[:remaining_guesses]
    state.guessed_letters = game[:guessed_letters]
  end
end
