# odin-hangman
The Odin Project's Hangman Project

Let's plan and outline first before writing code. How does this structure look? 

Word Class
- purpose: 
-- responsible for choosing a word from the dictionary
constants
-- MIN_WORD_LENGTH = 5
-- MAX_WORD_LENGTH = 12
- instance variables
-- dictionary (array)
- instance methods: 
-- initialize
-- word: randomly picks the word for guessing

Game class
- purpose: manages game controller
- constants: NUMBER_OF_ROUNDS = 12
- instance variables:
-- game_over?
- instance methods: 
-- initialize variables
-- game loop
1. create objects
--- Load previous or
--- instantiate new Board, State, Word, Interface objects
2. run game logic
--- prompt the Interface class for guesser to enter a guess 
--- get the Board class to validate and provide feedback
--- get Interface class to provide feedback and display board
--- get State class to track game over conditions
3. replay
--- repeat rounds until game over
-- ask to play another round 

State class
- purposes: tracks the guess history
- instance variables: 
-- guesses (array)
-- game_over?
-- winner?
- instance methods:
-- initialize 
-- tracks history of guesses

Board class (tracks board state)
- purpose: validates guesses against word, provides feedback
- instance methods:
-- initialize variables
-- validates the guess against the code in the Code class
-- checks for gameover conditions

Interface class
- purpose: supplies options to save & load games, validate user inputs, prints messages
- instance variables
- instance methods: 
-- gets guesser's inputs
-- validates inputs
-- prints message if invalid guess
-- display guess
-- display history of guess after every turn
-- display hints 

 main.rb
- instantiate new Game object
