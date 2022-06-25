require_relative 'text'

# TODO: Game class
class Game
  include Text
  def initialize
    @state = {
      guesses: 0,
      wrong_letters: [],
      word: pick_word
    }
  end

  def play_game
    menu
    puts 'GAME STARTS'
  end

  def menu
    puts messages[:welcome], messages[:new_or_load]
    loop do
      selection = gets.chomp.upcase
      if selection == 'L'
        load_save
        break
      elsif selection == 'N'
        pick_word
        break
      end
    end
  end

  # TODO: serialize state func
  # TODO: save game func
  # TODO: Start game func
  # TODO: Welcome func

  def load_save
    # TODO: Load game func
  end

  def pick_word
    # TODO: Pick word func
    'random'
  end

  # TODO: Display func
  # TODO: Render word helper func
  # TODO: Win game func
end