# TODO: text module
module Text
  # TODO: Screen clear func
  # TODO: Play display
  def messages(sub = '')
    { welcome: "Welcome to Hangman!",
      new_or_load: "Would you like to start a new game or load a save?",
      new_or_load_option: "- Enter 'N' for new or 'L' to load -",
      wrong_choices: "Wrong letters:",
      pick_letter: "Pick a letter or enter 'save' to save game for later!",
      invalid_letter: "Not a valid letter! Enter just a letter or 'save'!",
      already_picked_letter: "Already picked '#{sub}'! Pick again or 'save'!",
      won: "Nice one! You won!",
      lost: "Uhoh! Game over! The word was: #{sub}"
     }
  end

  def boards
    [
      '

          
          
          
          
          
    =========',
      '
      
          |
          |
          |
          |
          |
    =========',
      ' 
      +---+
      |   |
          |
          |
          |
          |
    =========',
      '
      +---+
      |   |
      O   |
          |
          |
          |
    =========',
      '
      +---+
      |   |
      O   |
      |   |
          |
          |
    =========',
      '
      +---+
      |   |
      O   |
     /|   |
          |
          |
    =========',
      '
      +---+
      |   |
      O   |
     /|\  |
          |
          |
    =========',
      '
      +---+
      |   |
      O   |
     /|\  |
     /    |
          |
    =========',
      '
      +---+
      |   |
      O   |
     /|\  |
     / \  |
          |
    ========='
    ]
  end
end