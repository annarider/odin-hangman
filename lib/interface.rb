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
    "🔥 Welcome to the Hangman game. You're the
    guessing player. I will pick a word, and
    you get to guess the letters."
  end

  def guess
    puts <<~REQUEST
      🔥 What's your guess?
      🆙 Type in your letter:
    REQUEST
    request_guess
  end

  private

  def request_guess
    code = gets.chomp.downcase.delete(' ').chars
    code = code_again until valid?(code)
    code  
  end

  def valid?
    'Check'
  end
end
