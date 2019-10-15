require 'pry'

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

	def attacks(player)
		puts "Le joueur #{@name} attaque le joueur #{player.name}"
		#Associate the value of damage to damage from compute_damage
		damages = compute_damage
		puts "Il inflige #{damages} points de dommages. "
		#the player get damages from the other player
		player.gets_damage(damages)

	end

	def compute_damage
		#choose a random value of damage 
		return rand(1..6)
	end

end

class HumanPlayer < Player

	attr_accessor :weapon_level

	def initialize(player_name)
		@name = player_name
		@lifepoints = 100
		@weapon_level = 1
	end 

	def show_state
		puts "#{@name} a #{@lifepoints} points de vie et une put** d'arme de niveau #{weapon_level}"
	end

	def compute_damage
		#Damage with the weapon level
		rand(1..6) * @weapon_level
	end

	def search_weapon
		#Associate a damage level to a weapon
		new_weapon_level = rand(1..6)
		puts "WOOOH tu as trouvé une arme de niveau #{new_weapon_level} BG"

		#if new_weapon
		if @weapon_level >= new_weapon_level
			puts "Bof.. c'est du caca, l'actuelle est mieux..."
		else 
			puts "YOUHOOOOU, elle est meilleure que celle actuellement => je la garde pardi!"
			@weapon_level = new_weapon_level
		end
	end

	def search_health_pack
		#get the health pack a level between 1 and 6
		pack_level = rand(1..6)
		
		if pack_level == 1
			puts "Tu n'as rien trouvé looooser..."

		elsif pack_level >= 2 && pack_level <= 5 
			puts "BRAVO ! Tu as trouvé un pack +50 points de vie YEAH"
			#Get 50points if lifepoints < 50
			#Get 100 elsif because you can't have more than 100
			if @lifepoints <= 50
				@lifepoints = @lifepoints + 50
			else
				@@lifepoints = 100
			end
			
		elsif pack_level == 6 
			puts "WOUAAAW tu as trouvé un pack +80 points de vie !!!!"
			if @lifepoints <= 20
				@lifepoints = @lifepoints + 80
			else
				@lifepoints = 100
			end

		end

	end


end 

#binding.pry
