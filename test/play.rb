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
    p "Secret word: #{@secret_word}"
    @board = Board.new(@secret_word)
    @game = Game.new
  end
  
  def self.test_board_setup
    @guess = 'a'
    # @board.word = @guess
    p "board: #{@board}"
    p "board: #{@board.word}, #{board.track(@guess)}"
    p "check word guess: #{@board.win?}"
    p "check random guess: #{@board.win?}"
  end

  def self.test_state
    state = State.new(Game::NUMBER_OF_ROUNDS)
    p state
    p "game_over? #{state.game_over?(@board)}"
    p "remaining guesses: #{state.remaining_guesses}"
  end

  def self.test_guess_feedback
    random_vowel = ['a', 'e', 'i', 'o', 'u', 'y'].sample
    p random_vowel
    p "feedback on random vowel: #{@board.track(random_vowel)}"
    p "feedback on guess: #{@board.track(@guess)}"
    p @guess
  end

  def self.test_game_over
    @board.current_guess = @secret_word ## have Game class call to set guess
    p "game_over with code? #{@board.game_over?}, #{@secret_word}"
    @board.current_guess = @guess
    p "game_over with guess? #{@board.game_over?}, #{@guess}}"
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
  TestPlay.test_state
  TestPlay.test_guess_feedback
  # TestPlay.test_game_over
  # TestPlay.test_board_history
  # TestPlay.test_interface
end
