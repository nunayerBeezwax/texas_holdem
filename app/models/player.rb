class Player < ActiveRecord::Base


	has_and_belongs_to_many :tables
	has_and_belongs_to_many :cards
	
end	