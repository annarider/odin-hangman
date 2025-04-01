# frozen_string_literal: true

# Test Play tests Hangman
# game play by allowing to set the 
# secret word and guesses. It 
# tests game logic, scoring, 
# interface, etc.
#
require_relative '../lib/secret'
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/interface'
require_relative '../lib/state'
require_relative 'word'

module TestPlay
  class << self
    attr_accessor :secret_word, :board, :guess, :game
  end

  class MockInterface < Interface
    def initialize(guesses)
      @guesses = guesses
      @current_guess_count = 0 
    end
  end

  def self.setup
    p @word
    @secret_word = Secret.pick_word
    p @secret_word
    @guess = 'a'
    @board = Board.new(@secret_word, @guess)
    @game = Game.new
  end

  def self.test_board_setup
    @board.word = @guess
    p "board: #{@board}"
    p "board: #{@board.word}, #{board.guess_history}"
    p "check word guess: #{@board.win?}"
    p "check random guess: #{@board.win?}"
  end

  def self.test_guess_feedback
    p "feedback: #{@board.feedback(@secret_word)}"
    p "feedback: #{@board.feedback(@guess)}"
  end

  def self.test_gameover
    @board.current_guess = @secret_word ## have Game class call to set guess
    p "gameover with code? #{@board.game_over?}, #{@secret_word}"
    @board.current_guess = @guess
    p "gameover with guess? #{@board.game_over?}, #{@guess}}"
  end

  def self.test_board_history
    p "history: #{@board.history}"
  end

  def self.test_interface
    interface = Interface.new
    interface.welcome
    guess = interface.guess
    p guess
    p interface.valid?(guess)
    interface.show_board(@board)
  end
end

if __FILE__ == $PROGRAM_NAME
  TestPlay.setup
  TestPlay.test_board_setup
  # TestPlay.test_guess_feedback
  # TestPlay.test_gameover
  # TestPlay.test_board_history
  # TestPlay.test_interface
end
