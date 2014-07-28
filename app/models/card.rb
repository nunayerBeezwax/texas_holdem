class Card
	attr_reader :suit, :rank, :pic, :index
	
	def initialize(attributes)
		@index = attributes[:index]
		@suit = attributes[:suit]
		@rank = attributes[:rank]
		@pic = attributes[:pic]
	end
end