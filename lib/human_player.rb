# frozen_string_literal: true

require_relative 'player'

class HumanPlayer < Player
  def prompt_for_name
    print "Please enter your name (or make one up, that's cool too): "
    gets.chomp
  end
end
