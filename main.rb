# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/human_player'
require_relative 'lib/computer_player'

Game.new(ComputerPlayer, HumanPlayer).play
