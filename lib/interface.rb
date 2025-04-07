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
    puts <<~MESSAGE
      🔥 Welcome to the Hangman game. You're the
      guessing player. I will pick a word, and
      you get to guess the letters.
    MESSAGE
    load_game
  end

  def guess(board, state)
    puts "Here's your hint: #{show_word(board)}"
    puts valid_guess_example
    puts <<~REQUEST
      🔥 What's your guess?
      🆙 Type in your letter:
    REQUEST
    request_guess(state)
  end

  def show_board(state)
    puts guess_history(state)
    puts "🧳 Guess #{State::NUMBER_OF_ROUNDS - state.remaining_guesses} out of #{State::NUMBER_OF_ROUNDS} guesses."
  end

  def announce_win
    puts '⭐️ Game over. You won! You figured out the secret word.'
  end

  def announce_lose
    puts '😱 Game over. Sorry you ran out of guesses and lost.'
  end

  def save_game
    puts <<~MESSAGE
      🧳 Would you like to save this game? Type in the game's 
      filename you want to save it as. Otherwise, hit return
      to keep guessing.
    MESSAGE
    gets.chomp.downcase.delete(' ')
  end

  private

  def request_guess(state)
    guess = gets.chomp.downcase.delete(' ')
    guess = guess_again(state) until valid?(state, guess)
    guess
  end

  def valid?(state, guess)
    return false unless guess.length == 1

    return false if state.guessed_letters.include?(guess)

    guess.match?(/[a-z]/)
  end

  def guess_again(state)
    puts '❌ Invalid letter or you already guessed this letter. Try again.'
    puts valid_guess_example
    puts guess_history(state)
    request_guess(state)
  end

  def valid_guess_example
    '🔠 You can pick any letter of the alphabet from a to z.'
  end

  def guess_history(state)
    "↔️ History of guesses: #{add_spaces(state.guessed_letters)}"
  end

  def show_word(board)
    add_spaces(board.correct_guesses)
  end

  def add_spaces(string)
    string.split('').join(' ')
  end

  def load_game
    puts <<~MESSAGE
      🔮 If you want to start a new game, hit return.
      If you want to play a saved game, give me the game's name. 
      Here are all the saved games you can play:
    MESSAGE
    puts Dir.entries('./saved_games')
    gets.chomp.downcase.slice!('.txt')
  end
end
