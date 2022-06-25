require_relative 'text'

# TODO: Game class
class Game
  include Text
  def initialize(state = {})
    @state == state
    if state.empty?
      @state = {
        guesses: 0,
        wrong_letters: [],
        word: pick_word
      }
    end
  end

  # TODO: serialize state func
  # TODO: save game func

  # TODO: Start game func

  def pick_word
    # TODO: Pick word func
    'random'
  end

  # TODO: Display func
    # TODO: Render word helper func
  # TODO: Win game func
end