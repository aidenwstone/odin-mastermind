# frozen_string_literal: true

require 'colorize'

class Game
  def initialize(code_creator_class, code_guesser_class)
    @code_creator = code_creator_class.new(self)
    @code_guesser = code_guesser_class.new(self)
    @board = Array.new(10) { Array.new(4, '-') }
    @secret_code = @code_creator.create_secret_code
    @current_turn = 0
  end

  private

  def draw_board
    @board.reverse_each do |row|
      print '|'
      row.each { |color| print " #{color.to_s[0].colorize(color)} " }
      puts '|'
    end
  end
end
