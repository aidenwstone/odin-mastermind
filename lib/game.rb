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
end
