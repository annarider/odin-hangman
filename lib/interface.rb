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

  def guess(board)
    puts valid_guess_example
    puts <<~REQUEST
      🔥 What's your guess?
      🆙 Type in your letter:
    REQUEST
    request_guess(board)
  end

  def show_board(board, state)
    puts guess_history(board)
    puts "🧳 Guess #{State::NUMBER_OF_ROUNDS - state.remaining_guesses} out of #{State::NUMBER_OF_ROUNDS} guesses."
  end

  def announce_win
    puts "⭐️ Game over. You won! You figured out the secret word."
  end

  def announce_lose
    puts "😱 Game over. Sorry you ran out of guesses and lost."
  end
  
  private
  
  def request_guess(board)
    guess = gets.chomp.downcase.delete(' ')
    guess = guess_again(board) until valid?(board, guess)
    guess  
  end
  
  def valid?(board, guess)
    return false unless guess.length == 1

    return false if board.guessed_letters.include?(guess)

    guess.match?(/[a-z]/)
  end

  def guess_again(board)
    puts '❌ Invalid letter or you already guessed this letter. Try again.'
    puts valid_guess_example
    puts guess_history(board)
    request_guess(board)
  end

  def valid_guess_example
    '🔠 You can pick any letter of the alphabet from a to z.'
  end

  def guess_history(board)
    "↔️ History of guesses: #{board.guessed_letters}"
  end
end
