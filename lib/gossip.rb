#require 'pry'
require 'csv'

class Gossip
	attr_accessor :author, :content, :id

	def initialize(author, content)
		@author = author
		@content = content
	end


	def save
		#Ouvrir le csv en mode écriture ab, qui a pour chemin "./db..."
		CSV.open("./db/gossip.csv", "ab") do |csv|
			#Inserer une ligne avec deux colonne
			csv << [@author, @content]
		end
	end

	def self.all
		#initialise un array vide
		all_gossips = [] 
		CSV.read("./db/gossip.csv").each do |csv_line|
			all_gossips << Gossip.new(csv_line[0], csv_line[1])	
		end
		return all_gossips
	end

	def self.find(id)
		@author = self.all[id.to_i].author
		@content = self.all[id.to_i].content
		return [@author, @content]
		#return [self.all[id.to_i].author,  self.all[id.to_i].content].join(" à écrit : ")
	end

end

#binding.pry

