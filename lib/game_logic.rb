# frozen_string_literal: true

require 'require_all'
require_all 'lib'

# the class for handling the game logic of hangman
class GameLogic
  include DisplayText
  include PickWord
  # the player is allowed 7 mistakes to make
  def initialize
    initialize_content
    make_guess
  end

  def initialize_content
    initialize_hash
    initialize_pick_word
  end

  def initialize_hash
    @game_content = {
      input: '',
      guessing_word: [],
      displaying_word: [],
      guessed_characters: [],
      guesses: {
        guesses_count: 0,
        mistakes_count: 0
      }
    }
  end

  def initialize_pick_word
    @game_content[:guessing_word] << choose_random_word('google-10000-english-no-swears.txt')
    @game_content[:displaying_word] = Array.new(1) { '_' * @game_content[:guessing_word][0].length }
    @game_content[:displaying_word][0].gsub!(/(.{1})(?=.)/, '\1 \2')
  end

  def make_guess
    until @game_content[:guesses][:mistakes_count] >= 7
      p @game_content
      input
      validate_guess
      update_guessed_characters
      update_displaying_word
    end
    loosing_message
  end

  def validate_guess
    if char_included?
      good_guess
    else
      bad_guess
    end
  end

  def good_guess
    display_string("Thats right, '#{@game_content[:input]}' is in the word!")
    @game_content[:guesses][:guesses_count] += 1
  end

  def bad_guess
    display_string("Im sorry, '#{@game_content[:input]}' is not in the word!")
    @game_content[:guesses][:guesses_count] += 1
    @game_content[:guesses][:mistakes_count] += 1
  end

  def input
    display_string('Please type in one alphabetical character that you didnt choose yet!')
    @game_content[:input] = gets.chomp.downcase
    validate_input
  end

  def validate_input
    input until
      @game_content[:input].length == 1 &&
      @game_content[:input].match?(/[[:alpha:]]/) &&
      !already_guessed? # in zukunft rausziehen in guess methode
  end

  def already_guessed?
    @game_content[:guessed_characters].include?(@game_content[:input])
  end

  def char_included?
    @game_content[:guessing_word][0].include?(@game_content[:input])
  end

  def update_guessed_characters
    @game_content[:guessed_characters] << @game_content[:input]
  end

  def update_displaying_word
    @game_content[:guessing_word][0].each_char.with_index do |char, index|
      @times_index = index * 2
      @game_content[:displaying_word][0][@times_index] = char if char == @game_content[:input]
    end
  end
end
