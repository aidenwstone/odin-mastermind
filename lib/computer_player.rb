# frozen_string_literal: true

require_relative 'player'

class ComputerPlayer < Player
  POSSIBLE_NAMES = ['Moyer the Destroyer', 'Bad Chad', 'Baron von Cavitus', 'Dr. McFisto', 'Mr. Nemesis'].freeze

  def create_secret_code
    @game.available_colors.sample(4)
  end

  private

  def prompt_for_name
    POSSIBLE_NAMES.sample
  end
end
