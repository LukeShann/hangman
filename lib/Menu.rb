require_relative 'text'
require_relative 'screen'
require 'JSON'

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

  def load_save
    save = File.read('../saved_game.txt')
    JSON.parse(save, symbolize_names: true)
  end

  def start_menu
    clear
    print_message(messages[:welcome], messages[:new_or_load], messages[:new_or_load_option])
    loop do
      selection = gets.chomp.upcase
      if selection == 'L'
        if File.exist?('../saved_game.txt')
          @game = Game.new(self, load_save)
        else
          puts 'No save file found'
        end
        break
      elsif selection == 'N'
        new_game
        break
      end
    end
  end
end