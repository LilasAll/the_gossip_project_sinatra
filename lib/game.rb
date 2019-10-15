require 'pry'
require_relative 'player'

class Game
	attr_accessor :human_player, :enemies
	@enemies = Array.new

	def initialize(player_name)
		@name = player_name
		4.times do 
			player = Player.new
			enemies << player
		end
	end

end

binding.pry