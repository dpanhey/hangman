# frozen_string_literal: true

require 'require_all'
require_all 'lib'

# the class for handling the game logic of hangman
class GameLogic
  include DisplayText
  include PickWord
  # the player is allowed 7 mistakes to make
  def initialize
    initialize_words
  end

  def initialize_words
    @guessing_word = [] << choose_random_word('google-10000-english-no-swears.txt')
    @displaying_word = Array.new(1) { |e| e = '_' * @guessing_word[0].length }
    @displaying_word[0].gsub!(/(.{1})(?=.)/, '\1 \2')
  end
end
