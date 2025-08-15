# frozen_string_literal: true

require_relative 'player'

class ComputerPlayer < Player
  POSSIBLE_NAMES = ['Moyer the Destroyer', 'Bad Chad', 'Baron von Cavitus', 'Dr. McFisto', 'Mr. Nemesis'].freeze

  def initialize(game)
    super
    @possible_codes = @game.available_colors.permutation(4).to_a
  end

  def create_secret_code
    @game.available_colors.sample(4)
  end

  private

  def prompt_for_name
    POSSIBLE_NAMES.sample
  end

  def filter_possible_codes
    previous_guess = @game.board[@game.current_turn - 2]
    previous_feedback = @game.feedback[@game.current_turn - 2]
    @possible_codes.filter { |code| @game.evaluate_guess(previous_guess, code) == previous_feedback }
  end
end
