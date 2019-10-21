#require 'pry'
require 'csv'

class Gossip
	attr_accessor :author, :content

	def initialize(author, content)
		@author = author
		@content = content
	end


	def save
		#Ouvrir le csv en mode écriture ab, qui a pour chemin "./db..."
		CSV.open("./db/gossip.csv", "ab") do |csv|
			#Inserer une ligne avec deux colonne
			csv << [author, content]
		end
	end

end

#binding.pry

