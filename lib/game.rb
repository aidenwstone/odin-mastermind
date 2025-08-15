# frozen_string_literal: true

require 'colorize'

class Game
  AVAILABLE_COLORS = %i[black red green yellow blue magenta cyan white].freeze
  MAX_TURNS = 10

  attr_reader :current_turn, :feedback, :board

  def initialize(code_creator_class, code_guesser_class)
    @winner = nil
    @code_creator = code_creator_class.new(self)
    @code_guesser = code_guesser_class.new(self)
    @board = Array.new(MAX_TURNS) { Array.new(4, '-') }
    @feedback = Array.new(MAX_TURNS) { { correct_location: ' ', correct_color: ' ' } }
    @secret_code = @code_creator.create_secret_code
    @current_turn = 0
  end

  def play # rubocop:disable Metrics/MethodLength
    draw_board

    until game_over?
      @current_turn += 1
      guess = @code_guesser.guess_secret_code
      @winner = @code_guesser if guess == @secret_code

      @board[@current_turn - 1] = guess
      @feedback[@current_turn - 1] = evaluate_guess(guess, @secret_code)

      draw_board
      sleep(1) if @code_guesser.instance_of?(ComputerPlayer)
    end

    @winner = @code_creator if @winner.nil?
    announce_result
  end

  def evaluate_guess(guess, code)
    correct_locations = guess.zip(code).filter_map do |guess_color, secret_color|
      guess_color if guess_color == secret_color
    end
    correct_colors = guess.intersection(code - correct_locations)
    { correct_location: correct_locations.length, correct_color: correct_colors.length }
  end

  def display_available_colors
    puts AVAILABLE_COLORS.map { |color| color.to_s.colorize(color) }.join(' | ')
  end

  def valid_code?(code)
    code.all? { |color| AVAILABLE_COLORS.include?(color) } && code.length == 4
  end

  def available_colors
    AVAILABLE_COLORS
  end

  private

  def draw_board
    @board.zip(@feedback).reverse_each do |row, feedback|
      print '|'
      row.each { |color| print " #{color.to_s[0].colorize(color)} " }
      puts "|#{feedback[:correct_location].to_s.colorize(:red)}|#{feedback[:correct_color]}|"
    end
  end

  def game_over?
    @winner || @current_turn == MAX_TURNS
  end

  def announce_result
    puts "\nThe winner is #{@winner}!"
    puts "The secret code was:#{@secret_code.map { |color| " #{color.to_s.colorize(color)}" }.join}"
  end
end
