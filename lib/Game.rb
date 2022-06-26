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
        word: pick_word,
        picked_letters: [],
        game_over: false
      }
    end
  end

  def play_game
    loop do
      render
      # evaluate_guess(get_guess)
      get_guess
      @state[:game_over] = true
      break if @state[:game_over]
      # if game is won, break
    end
  end

  def get_guess
    guess = ''
    loop do
      guess = gets.chomp.upcase
      continue if guess.length != 1
      continue if guess.match(/[A-Z]/) == nil
      continue if @
    end
    guess
  end


  # TODO: serialize state func
  # TODO: save game func
  # TODO: Win game func

  def load_save
    # TODO: Load game func
  end

  def pick_word
    @state[:word] = File.readlines('./dictionary.txt').sample.upcase.strip
  end

  def render
    clear
    print_board(@state[:guesses])
    print_message(format_word)
    print_message(messages[:wrong_choices], wrong_choices, messages[:pick_letter])
  end

  def format_word
    arr = @state[:word].split('')
    formatted = arr.map { |letter| @state[:picked_letters].include?(letter) ? letter : '_'}
    formatted.join(' ')
  end

  def wrong_choices
    @state[:picked_letters].select { |letter| !@state[:word].include?(letter) }
  end

end