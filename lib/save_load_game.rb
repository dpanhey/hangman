# frozen_string_literal: true

require 'json'

# the module for the saving and loading methods for hangman
module SaveLoadGame
  def ask_for_load
    display_string("If you want to load a savegame, type 'load'.")
    load_file(ask_for_filename) if gets.chomp == 'load'
  end

  def ask_for_filename
    display_string('Type in the name of your file.')
    gets.chomp
  end

  def load_file(filename)
    File.exist?(filename) ? from_json(File.read(filename)) : 'No such File detected!'
  end

  def ask_for_save
    display_string("If you want to save this game, type 'save'.")
    save_file if gets.chomp == 'save'
  end

  def save_file
    Dir.mkdir('../savegames') unless Dir.exist?('../savegames')

    savegame_name = "savegame_#{@game_content[guessing_word[0]]}.txt"
    File.open("../#{savegame_name}", 'w') { |file| file.puts to_json }
    display_string("File #{savegame_name} saved sucessfull! You may close this game.")
  end

  def to_json(*_args)
    content = Hash.new { |hash, key| hash[key] = hash.dup.clear }
    instance_variables.each do |variables|
      content[variables] = instance_variable_get variables
    end
    content.to_json
  end

  def from_json!(string)
    JSON.parse(string).each do |variable, value|
      instance_variable_set variable, value
    end
  end
end
