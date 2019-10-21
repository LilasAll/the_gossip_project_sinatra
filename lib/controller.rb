
#Classe qui hérite de la classe Sinatra
#Elle aura toutes les fonctionnalités de base de Sinatra 
class ApplicationController < Sinatra::Base
	#Si qql av sur l'URL / fait le code qui suit
  get '/' do
    erb :index
  end

  get '/gossips/new/' do
  	erb :new_gossip
  end 

  post '/gossips/new/' do
  	puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
	end

end