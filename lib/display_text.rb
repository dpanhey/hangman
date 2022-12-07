# frozen_string_literal: true

# the module for displaying content in the terminal
module DisplayText
  def display_word_sleep(word)
    word.each_char do |char|
      print char
      sleep 0.025
      $stdout.flush
    end
  end

  def display_string(string)
    display_word_sleep(string)
    print "\n"
    sleep 0.3
  end

  def display_multiline_string(array)
    array.each do |element|
      display_word_sleep(element)
      print "\n"
      sleep 0.5
    end
  end

  def display_turn_text
    display_mistake_counter
    display_guessed_characters
    display_displaying_word
  end

  def display_mistake_counter
    display_string("Mistakes: #{@game_content[:guesses][:mistakes_count]} of 7!")
  end

  def display_displaying_word
    display_string("Your guessed word so far: #{@game_content[:displaying_word][0]}")
  end

  def display_guessed_characters
    display_string("Your guessed characters so far: #{@game_content[:guessed_characters]}")
  end

  def intro_message
    display_multiline_string(['Welcome to Hangman!',
                              'In this game, you have to guess the right word.',
                              'You are allowed to make 7 mistakes, after that you lose!'])
  end

  def winning_message
    display_multiline_string(["Yes, '#{@game_content[:guessing_word][0]}' is the right answer!",
                              "You won after #{@game_content[:guesses][:guesses_count]} guesses and "\
                              "#{@game_content[:guesses][:mistakes_count]} mistakes!"])
  end

  def loosing_message
    display_multiline_string(["Oh no, that was your last guess for the word: '#{@game_content[:guessing_word][0]}'!",
                              "You loose after #{@game_content[:guesses][:guesses_count]} guesses and "\
                              "#{@game_content[:guesses][:mistakes_count]} mistakes!"])
  end
end
