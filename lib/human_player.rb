# frozen_string_literal: true

require_relative 'player'

class HumanPlayer < Player
  def prompt_for_name
    print "Please enter your name (or make one up, that's cool too): "
    gets.chomp
  end

  def display_available_colors
    puts AVAILABLE_COLORS.map { |color| color.to_s.colorize(color) }.join(' | ')
  end
end
