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

  NUMBER_OF_ROUNDS = 12
  
  attr_accessor :word, :board, :state, :interface

  def initialize
    @word = Secret.pick_word
    @interface = Interface.new
    guess = @interface.guess
    @board = Board.new(@word, guess)
    @state = State.new(NUMBER_OF_ROUNDS)
  end
end
