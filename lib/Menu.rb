require_relative 'text'

class Menu
  include Text
  def initialize
    start_menu
    @game.play_game
  end

  def new_game
    @game = Game.new(self)
  end

  def start_menu
    puts messages[:welcome], messages[:new_or_load]
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