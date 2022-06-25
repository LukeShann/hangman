require_relative 'text'
require_relative 'screen'

class Menu
  include Text
  include Screen

  def initialize
    start_menu
    @game.play_game
  end

  def new_game
    @game = Game.new(self)
  end

  def start_menu
    print_message(messages[:welcome], messages[:new_or_load], messages[:new_or_load_option])
    loop do
      selection = gets.chomp.upcase
      if selection == 'L'
        @game = Game.new(self, load_save)
        break
      elsif selection == 'N'
        new_game
        break
      end
    end
  end
end