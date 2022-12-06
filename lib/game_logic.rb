# frozen_string_literal: true

require 'require_all'
require_all 'lib'

# the class for handling the game logic of hangman
class GameLogic
  include DisplayText
  include PickWord
  # the player is allowed 7 mistakes to make
  def initialize
    initialize_variables
    input
  end

  def initialize_variables
    @guessing_word = [] << choose_random_word('google-10000-english-no-swears.txt')
    @displaying_word = Array.new(1) { '_' * @guessing_word[0].length }
    @displaying_word[0].gsub!(/(.{1})(?=.)/, '\1 \2')
    @guessed_characters = []
  end

  def input
    display_string('Please type in one alphabetical character that you didnt choose yet!')
    @input = gets.chomp.downcase
    validate_input
  end

  def validate_input
    @input = gets.chomp.downcase until
      @input.length == 1 &&
      @input.match?(/[[:alpha:]]/) &&
      !@displaying_word.include?(@input)
    @guessed_characters << @input
    @guessed_characters[0].gsub!(/(.{1})(?=.)/, '\1 \2')
  end
end
