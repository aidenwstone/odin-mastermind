# frozen_string_literal: true

require 'colorize'

class Game
  def initialize(code_creator_class, code_guesser_class)
    @winner = nil
    @code_creator = code_creator_class.new(self)
    @code_guesser = code_guesser_class.new(self)
    @board = Array.new(10) { Array.new(4, '-') }
    @feedback = Array.new(10) { { correct_location: ' ', correct_color: ' ' } }
    @secret_code = @code_creator.create_secret_code
    @current_turn = 0
  end

  private

  def draw_board
    @board.zip(@feedback).reverse_each do |row, feedback|
      print '|'
      row.each { |color| print " #{color.to_s[0].colorize(color)} " }
      puts "|#{feedback[:correct_location].to_s.colorize(:red)}|#{feedback[:correct_color]}|"
    end
  end

  def evaluate_guess(guess)
    correct_locations = guess.zip(@secret_code).filter_map do |guess_color, secret_color|
      guess_color if guess_color == secret_color
    end
    correct_colors = guess.intersection(@secret_code - correct_locations)
    { correct_location: correct_locations.length, correct_color: correct_colors.length }
  end
end
