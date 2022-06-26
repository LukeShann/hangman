# TODO: text module
module Text
  # TODO: Screen clear func
  # TODO: Play display
  def messages
    { welcome: "Welcome to Hangman!",
      new_or_load: "Would you like to start a new game or load a save?",
      new_or_load_option: "- Enter 'N' for new or 'L' to load -",
      wrong_choices: "Wrong letters ="
     }
  end

  def boards
    ['BOARD 0',
     'BOARD 1',
     'BOARD 2',
     'BOARD 3',
     'BOARD 4',
     'BOARD 5',
     'BOARD 6',
    ]
  end
end