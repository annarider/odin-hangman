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
    attr_accessor :secret_word, :board, :guess, :game, :state
  end

  class MockInterface < Interface
    def initialize(guesses)
      super()
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
    @state = State.new
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
    p @state
    p "game_over? #{@state.game_over?(@board)}"
    p "update round: #{state.update(@guess)}"
    p "remaining guesses: #{@state.remaining_guesses}"
  end

  def self.test_guess_feedback
    random_vowel = %w[a e i o u y].sample
    p random_vowel
    p "feedback on random vowel: #{@board.track(random_vowel)}"
    p "feedback on guess: #{@board.track(@guess)}"
    p @guess
    p "correct guesses: #{@board.correct_guesses}"
    p "guesses letters: #{@board.guessed_letters}"
  end

  def self.test_game_over
    @board.correct_guesses = @secret_word ## have Game class call to set guess
    p "game_over with code? #{@board.win?}, #{@secret_word}"
    p "game_over with state: #{@state.game_over?(@board)}"
    @board.correct_guesses = @guess
    p "game_over with guess? #{@board.win?}, #{@guess}"
    p "game_over with state: #{@state.game_over?(@board)}"
  end

  def self.test_game
    p "game: #{@game}"
  end

  def self.test_interface
    interface = Interface.new
    p interface.welcome
    guess = interface.guess(@board)
    p guess
    # p interface.valid?(guess)
    interface.show_board(@board, @state)
  end
end

if __FILE__ == $PROGRAM_NAME
  TestPlay.setup
  TestPlay.test_board_setup
  TestPlay.test_state
  TestPlay.test_guess_feedback
  TestPlay.test_game_over
  TestPlay.test_game
  TestPlay.test_interface
end
