# frozen_string_literal: true

require_relative 'player'

class HumanPlayer < Player
  def guess_secret_code
    loop do
      puts "\n#{@name}, guess the secret code, using the available colors (e.g. red green yellow blue):"
      display_available_colors
      guess = gets.chomp.downcase.split.map(&:to_sym)
      return guess if guess.all? { |color| AVAILABLE_COLORS.include?(color) } && guess.length == 4
    end
  end

  private

  def prompt_for_name
    print "Please enter your name (or make one up, that's cool too): "
    gets.chomp
  end

  def display_available_colors
    puts AVAILABLE_COLORS.map { |color| color.to_s.colorize(color) }.join(' | ')
  end

  def valid_code?(code)
    code.all? { |color| AVAILABLE_COLORS.include?(color) } && code.length == 4
  end
end
