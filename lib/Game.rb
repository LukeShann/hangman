require_relative 'text'
require_relative 'screen'

class Game
  include Text
  include Screen

  def initialize(menu, state = {})
    @menu = menu
    @state = state
    if state.empty?
      @state = {
        guesses: 0,
        picked_letters: [],
        word: pick_word,
        game_over: false
      }
    end
  end

  def play_game
    loop do
      display_game
      # evaluate_guess(get_guess)
      @state[:game_over] = true
      break if @state[:game_over]
      # if game is won, break
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
    @state[:word] = File.readlines('./dictionary.txt').sample.upcase.strip
  end

  # TODO: Display func
  def display_game
    clear
    print_board(@state[:guesses])
    print_message(format_word)
    print_message(messages[:wrong_choices], wrong_choices)
  end

  def format_word
    arr = @state[:word].split('')
    formatted = arr.map { |letter| @state[:picked_letters].include?(letter) ? letter : '_'}
    formatted.join(' ')
  end

  def wrong_choices
    @state[:picked_letters].select { |letter| !@state[:word].include?(letter) }
  end

  # TODO: Render word helper func
  # TODO: Win game func
end