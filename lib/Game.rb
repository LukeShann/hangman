require_relative 'text'
require_relative 'screen'
require 'JSON'

class Game
  include Text
  include Screen

  def initialize(menu, state = {})
    @menu = menu
    @state = state
    if state.empty?
      @state = {
        wrong_guesses: 0,
        word: pick_word,
        displayed_letters: word_negative(@state[:word]),
        picked_letters: [],
        game_over: false
      }
    end
  end

  def play_game
    loop do
      render
      guess = get_guess
      break if guess == 'SAVE'
      evaluate_guess(guess)
      break if @state[:game_over]
    end
  end

  def get_guess
    guess = ''
    loop do
      guess = gets.chomp.upcase
      return guess if guess == 'SAVE'
      next if guess.length != 1
      next if guess.match(/[A-Z]/) == nil
      next if @state[:picked_letters].include?(guess)
      break
    end
    guess
  end

  def evaluate_guess(guess)
    if @state[:word].include?(guess)
      @state[:word].split('').each_with_index do |letter, i|
        @state[:displayed_letters][i] = letter if letter == guess
      end
      game_over(true) unless @state[:displayed_letters].include?('_')
    else
      @state[:picked_letters] << guess
      @state[:wrong_guesses] += 1
    end
    game_over(false) if @state[:wrong_guesses] > 7
  end

  def game_over(won)
    render
    puts won ? 'You WIN!' : 'You Lose!'
    @state[:game_over] = true
  end

  # TODO: serialize state func
  # TODO: save game func

  def load_save
    # TODO: Load game func
  end

  def save_game
    File.open('./saved_game.txt', 'w') { |file| file.write(@state.to_json) }
    # TODO: exit program here
    'GAME ENDS'
  end


  def pick_word
    @state[:word] = File.readlines('./dictionary.txt').sample.upcase.strip
  end

  def word_negative(word)
    Array.new(word.length, '_')
  end

  def render
    clear
    print_board(@state[:wrong_guesses])
    print_message(@state[:displayed_letters].join(' '))
    print_message(
      messages[:wrong_choices],
      @state[:picked_letters].join(' '),
      messages[:pick_letter])
  end
end