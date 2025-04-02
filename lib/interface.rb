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

  def show_board(board, state)
    puts "History of guesses: #{board.guessed_letters}"
    puts "Guess #{State::NUMBER_OF_ROUNDS - state.remaining_guesses} out of #{State::NUMBER_OF_ROUNDS} guesses."
  end

  def announce_win
    puts "Game over. You won! You figured out the secret word."
  end

  def announce_lose
    puts "Game over. Sorry you ran out of guesses and lost."
  end

  private

  def request_guess
    code = gets.chomp.downcase.delete(' ')
    code = code_again until valid?(code)
    code  
  end

  def valid?
    'Check'
  end
end
