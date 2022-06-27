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
    lines = boards[index].split("\n")
    offset = SCREEN_WIDTH / 2 - 9
    lines.each do |line|
      offset.times { print ' ' }
      puts line
    end
  end

  private

  def print_message_line(content)
    margin = (SCREEN_WIDTH - content.length) / 2 - 2
    margin += 7 if content.start_with?("\e")
    print "="
    margin.times { print ' ' }
    print " #{content} "
    (margin + content.length % 2).times { print ' ' }
    puts "="
  end
end
