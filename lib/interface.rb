# frozen_string_literal: true

# Interface class is the IO
# responsible for interacting with players.
# It validates user input, prompts for
# inputs, and displays messages to the
# players.
#
# @example Create a new Interface 
# interface = Interface.new
class Interface
  def welcome
    "Welcome to the Hangman game. You're the
    guessing player. I will pick a word, and
    you get to guess the letters."
  end
end
