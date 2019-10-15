class Player

	attr_accessor :name, :lifepoints

	def initialize(player_name)
		#Associate to name the name of the player
		@name = player_name
		#Get 10 life points to begin the game
		@lifepoints = 10
	end

	def show_state
		#Method to know the life points left for a player
		puts "#{@name} a #{@lifepoints} points de vie"
	end

	def gets_damage(damages)
		#substract the damage of the total lifepoints
		@lifepoints = @lifepoints - damages

		#Wanna know if the player still have lifepoints
		if @lifepoints <= 0
			puts "Le joueur #{@name} a été tué!!!!"
		else
		end
	end

end