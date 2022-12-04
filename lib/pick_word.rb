# frozen_string_literal: true

# The module for choosing a random Word from a text-file
module PickWord
  def load_file
    content = []
    file = File.open('../google-10000-english-no-swears.txt', 'r')
    until file.eof?
      line = file.readline.chomp
      content << line if line.length.between?(5, 12)
    end
    content
  end

  def choose_random_word
    load_file.sample
  end
end
