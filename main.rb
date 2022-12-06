# frozen_string_literal: true

require 'require_all'
require_all 'lib'

# the class for starting the game Hangman
class Hangman
  def initialize
    GameLogic.new
  end
end

p Hangman.new
