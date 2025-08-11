# frozen_string_literal: true

# The Player class manages generic player objects.
# It serves as a parent class for both human and computer players.
# It provides abstract methods that all child classes should implement.
class Player
  attr_reader :name

  def initialize(game)
    @game = game
    @name = prompt_for_name
  end

  def to_s
    @name
  end

  def prompt_for_name
    raise NotImplementedError, "#{self.class} must implement the 'prompt_for_name' method."
  end

  def create_secret_code
    raise NotImplementedError, "#{self.class} must implement the 'create_secret_code' method."
  end

  def guess_secret_code
    raise NotImplementedError, "#{self.class} must implement the 'guess_secret_code' method"
  end
end
