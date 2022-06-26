module Screen
  include Text
  SCREEN_WIDTH = 80

  def clear
    print "\e[2J\e[f"
  end

  def print_message(*args)
    SCREEN_WIDTH.times { print '=' }
    puts ''
    args.flatten.each { |message| print_message_line(message) }
    SCREEN_WIDTH.times { print '=' }
    puts "\n\n"
  end

  def print_board(index = 0)
    # TODO: Print word underneath board
    puts boards[index]
  end

  private

  def print_message_line(content)
    margin = (SCREEN_WIDTH - content.length) / 2 - 2
    print "="
    margin.times { print ' ' }
    print " #{content} "
    (margin + content.length % 2).times { print ' ' }
    puts "="
  end
end
