require_relative 'text'

class Game
  include Text
  def initialize(menu, state = {})
    @menu = menu
    @state = state
    if state.empty?
      @state = {
        guesses: 0,
        wrong_letters: [],
        word: pick_word
      }
    end
  end

  def play_game
    puts @state[:word]
  end

  # TODO: serialize state func
  # TODO: save game func
  # TODO: Start game func
  # TODO: Welcome func

  def load_save
    # TODO: Load game func
  end

  def pick_word
    @state[:word] = File.readlines('./dictionary.txt').sample.upcase.strip
  end

  # TODO: Display func
  # TODO: Render word helper func
  # TODO: Win game func
end