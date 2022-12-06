# frozen_string_literal: true

# the module for displaying content in the terminal
module DisplayText
  def display_word_sleep(word)
    word.each_char do |char|
      print char
      sleep 0.05
      $stdout.flush
    end
  end

  def display_string(string)
    display_word_sleep(string)
    print "\n"
  end

  def display_multiline_string(array)
    array.each do |element|
      display_word_sleep(element)
      print "\n"
      sleep 0.5
    end
  end

  def intro_message
    display_multiline_string(['Welcome to Hangman!',
                              'In this game, you have to guess the right word.',
                              'You are allowed to make 7 mistakes, after that you lose!'])
  end

  def winning_message(word, guesses, mistakes)
    display_multiline_string(["Yes, right, #{word} is the right answer!",
                              "You won after #{guesses} guesses and #{mistakes} mistakes!"])
  end

  def loosing_message(word, guesses, mistakes)
    display_multiline_string(["Oh no, that was your last guess for the word: #{word}!",
                              "You loose after #{guesses} guesses and #{mistakes} mistakes!"])
  end
end
