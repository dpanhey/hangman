# frozen_string_literal: true

require 'json'

# the module for the saving and loading methods for hangman
module SaveLoadGame
  def ask_for_load
    display_string("If you want to load a savegame, type 'load'.")
    load_savegame(ask_for_filename) if gets.chomp == 'load'
  end

  def ask_for_filename
    display_string('Type in the name of your file.')
    gets.chomp
  end

  def load_savegame(filename)
    if File.exist?("savegames/#{filename}.txt")
      from_json!(File.read("savegames/#{filename}.txt"))
      display_string('You succesfully loaded a game!')
      display_turn_text
    else
      display_string('No such File detected!')
    end
  end

  def ask_for_save
    display_string("If you want to save this game, type 'save'.")
    save_savegame if gets.chomp == 'save'
  end

  def save_savegame
    Dir.mkdir('savegames') unless Dir.exist?('savegames')

    savegame_name = "savegame_#{@game_content[:guessing_word][0]}.txt"
    File.open("savegames/#{savegame_name}", 'w') { |file| file.puts to_json }
    display_string("File #{savegame_name} saved successfull! You may close this game.")
  end

  def to_json(*_args)
    content = Hash.new { |hash, key| hash[key] = hash.dup.clear }
    instance_variables.each do |variables|
      content[variables] = instance_variable_get variables
    end
    content.to_json
  end

  def from_json!(string)
    JSON.parse(string, { symbolize_names: true }).each do |variable, value|
      instance_variable_set variable, value
    end
  end
end
