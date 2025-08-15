# frozen_string_literal: true

require_relative 'player'

# The HumanPlayer class manages a human player, using terminal input.
# It implements the abstract methods from the Player class, prompting the user for input
# to create a secret code and to guess the secret, depending on the role of the player.
class HumanPlayer < Player
  def guess_secret_code
    puts "\n#{@name}, guess the secret code, using the available colors (e.g. red green yellow blue):"
    @game.display_available_colors

    loop do
      guess = gets.chomp.downcase.split.map(&:to_sym)
      return guess if @game.valid_code?(guess)

      puts "\nInvalid guess, try again:"
    end
  end

  def create_secret_code
    puts "\n#{@name}, create a secret code, using the available colors, with no duplicates (e.g. red green yellow blue):" # rubocop:disable Layout/LineLength
    @game.display_available_colors

    loop do
      code = gets.chomp.downcase.split.uniq.map(&:to_sym)
      return code if @game.valid_code?(code)

      puts "\nInvalid code, try again:"
    end
  end

  private

  def prompt_for_name
    print "Please enter your name (or make one up, that's cool too): "
    gets.chomp
  end
end
