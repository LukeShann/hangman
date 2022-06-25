require 'open-uri'

acceptable_words = File.open('dictionary.txt', 'w')

file  = URI.open('https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt') { |f|
  f.each_line do |line|
    line.chomp!
    if line.length > 4 && line.length < 13
      acceptable_words.puts line
    end
  end
}

acceptable_words.close
