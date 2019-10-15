# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/game'
require_relative 'lib/player'


# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.

	##Get user names
	player1 = Player.new("Josiane")
	player2 = Player.new("José")

	while player1.lifepoints >= 0 or player2.lifepoints >= 0
		##Get the life level and name of each player
		puts "Voici l'état de chaque joueur :"
		puts "#{player1.show_state} #{player2.show_state}"
		puts "Passons à la phase d'attaque.. 3..2..1.. GOOOOOOOO"
		
		#Player 1 attacks player 2
		player1.attacks(player2)

			if player2.lifepoints <= 0
				#If player 2 don't have more points = stop the game
				break
			else
				#If player 2 still have some points	
				player2.attacks(player1)
					#If player1 have no more point = stop the game
					if player1.lifepoints <= 0
						break
					#Else continue
					else
					end
			end

	end

#binding.pry 



