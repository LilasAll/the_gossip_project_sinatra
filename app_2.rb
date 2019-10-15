require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "----------------------------------------"
puts "|--------WELCOME TO THE JUNGLE---------|"
puts "|IN THIS GAME JUST ON RULE: SURVIVE BRO|"
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
enemies = Array.new
enemies << [player1]
enemies << [player2]

#Create a loop while human player is still alive
#Or while one enemie is still alive
while player3.lifepoints >= 0 && (player1.lifepoints > 0 || player2.lifepoints > 0)
	puts "Voici ton état mon pote : "
	puts "#{player3.show_state}"

	#Give the menu
	puts "Quelle action veux-tu effectuer?"
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner"
	puts " "
	puts "Attaquer un autre joueur : "
	puts "0 - #{player1.show_state}"
	puts "1 - #{player2.show_state}"

	#Get the player choice
	print "> "
	choice = gets.chomp

	#Make a action, corresponding to the player choice
	if choice == "a"
		player3.search_weapon
	elsif choice == "s"
		player3.search_health_pack
	elsif choice == "0"
		player3.attacks(player1)
	elsif choice == "1"
		player3.attacks(player2)
	else
	end

	puts "Au tour des autres joueurs d'attaquer, c'est parti !!!"

	#Make the action attacks for each enemies
	enemies.each do |item|
		enemies[item].attacks(player3)
		if enemies.item.lifepoints <= 0
			break
		else
		end
	end

		




	
end

puts "Hélas la partie est déjà finie......"

if player3.lifepoints >= 0
	puts "BRAVOOOO TU AS GAGNE TE TROWW FOR"
else
	puts "PFFFF T TRO NUL LOOOSER, T MOR..."
end

binding.pry 
