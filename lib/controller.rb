require_relative 'gossip'

#Classe qui hérite de la classe Sinatra
#Elle aura toutes les fonctionnalités de base de Sinatra 
class ApplicationController < Sinatra::Base
	#Si qql av sur l'URL / fait le code qui suit

	get '/' do
	  erb :index, locals: {gossip: Gossip.all}
	end

  get '/gossips/new/' do
  	erb :new_gossip
  end 

  post '/gossips/new/' do
		Gossip.new(params["gossip_author"], params["gossip_content"]).save
		redirect '/'
	end


	#post '/gossips/new/' do
	#  puts "Salut, je suis dans le serveur"
	# puts "Ceci est le contenu du hash params : #{params}"
	#puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
	#  puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
	#  puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
	#end

end
