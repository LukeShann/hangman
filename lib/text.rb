# TODO: text module
module Text
  # TODO: Screen clear func
  # TODO: Play display
  def messages
    { welcome: "Welcome to Hangman!",
      new_or_load: "Would you like to start a new game or load a save?",
      new_or_load_option: "- Enter 'N' for new or 'L' to load -",
      wrong_choices: "Wrong letters:",
      pick_letter: "Pick a letter or enter 'save' to save game for later!"
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