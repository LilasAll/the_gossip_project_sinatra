require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "----------------------------------------"
puts "|--------WELCOME TO THE JUNGLE---------|"
puts "|IN THIS GAME JUST ONE RULE :  SURVIVE |"
puts "----------------------------------------"
puts "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-"

#Ask for the name
puts "First.. Give me your name please :"
print "> "
player_name = gets.chomp
player3 = HumanPlayer.new("#{player_name}")

#Get our favorite players : Josiane et José
player1 = Player.new("Josiane")
player2 = Player.new("José")
#Create an Array with the enemies
@enemies = Array.new
@enemies << player1
@enemies << player2

#Create a loop while human player is still alive
#Or while one enemie is still alive
while player3.lifepoints >= 0 && (player1.lifepoints > 0 || player2.lifepoints > 0)
	puts "--------------------------"
	puts " "
	puts "Voici ton état mon pote : "
	puts "#{player3.show_state}"
	puts "--------------------------"

	#Give the menu
	puts "Quelle action veux-tu effectuer?"
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner"
	puts " "
	puts "Attaquer un autre joueur : "
	puts "0 - #{player1.show_state}"
	puts "1 - #{player2.show_state}"

	#Get the player choice
	puts " "
	print "> "
	choice = gets.chomp
	puts " "
	puts "--------------------------"	

	#Make a action, corresponding to the player choice
	if choice == "a"
		player3.search_weapon
	elsif choice == "s"
		player3.search_health_pack
	elsif choice == "0"
		if player3.lifepoints > 0 
			player3.attacks(player1)
				if player1.lifepoints < 0
					player1.lifepoints = 0
				else
				end
		else
			puts "Il est déjà mort tu peux pas faire plus..."
		end
	elsif choice == "1"
		if player3.lifepoints > 0 
			player3.attacks(player2)
				if player2.lifepoints < 0
					player2.lifepoints = 0
				else
				end
		else
			puts "Il est déjà mort tu peux pas faire plus..."
		end
	else
	end

	puts " "
	puts "------------------------------------------------------"
	puts "Au tour des autres joueurs d'attaquer, c'est parti !!!"
	puts "------------------------------------------------------"
	puts " "

	#Make the action attacks for each enemies
	@enemies.each do |enemy| 
			if enemy.lifepoints > 0
				enemy.attacks(player3)
			else
				puts "Le joueur #{enemy.name} est mort, il ne peut pas t'attaquer"
			end
	end
	
end

puts " "
puts " "
puts " "
puts "Hélas la partie est déjà finie......"
puts " "
puts " "

if player3.lifepoints >= 0
	puts "------------------------------------"
	puts "---BRAVOOOO TU AS GAGNE CHAMPION----"
	puts "------------------------------------"
else
	puts "------------------------------------"
	puts "T'as réussi à perdre à ce jeu looser"
	puts "------------------------------------"
end

#binding.pry 
