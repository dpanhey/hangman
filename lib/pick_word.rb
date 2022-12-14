# frozen_string_literal: true

# The module for choosing a random Word from a text-file
module PickWord
  def load_file(file_path)
    content = []
    file = File.open(file_path, 'r')
    until file.eof?
      line = file.readline.chomp
      content << line if line.length.between?(5, 12)
    end
    content
  end

  def choose_random_word(file_path)
    load_file(file_path).sample
  end
end
