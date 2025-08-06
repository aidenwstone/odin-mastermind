# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/human_player'
require_relative 'lib/computer_player'

puts 'Welcome to Mastermind, would you like to be the code creator or guesser? (c for creator, g for guesser):'
answer = gets.chomp

until %w[c g].include?(answer)
  puts "\nPlease enter a valid response (c for creator, g for guesser):"
  answer = gets.chomp
end

code_creator = answer == 'c' ? HumanPlayer : ComputerPlayer
code_guesser = answer == 'g' ? HumanPlayer : ComputerPlayer

Game.new(code_creator, code_guesser).play
