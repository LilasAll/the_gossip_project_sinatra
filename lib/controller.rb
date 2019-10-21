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

  get '/gossips/:id' do
		#@gossip	=	all_gossips.select do |gossip|
		# gossip.id == params[:id]
		#end.first
		#{}"Voici le numéro du potin que tu veux: #{params['id']}!"
		#erb :'/gossips/show.html'
        id = params['id']
		Gossip.find(id)
	erb :show, locals: {gossip: Gossip.all}
  end
	
  post'/gossips/:id/edit' do |id|
    #gossip = Gossip.find(params[:id])
    Gossip.new(params["gossip_author"],params["gossip_content"]).edit(id.to_i)
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
