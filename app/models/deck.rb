class Deck

	attr_reader :cards

	def initialize
		@cards = []
		rank = %w{ 1 2 3 4 5 6 7 8 9 10 11 12 13 }
    	suit = %w{ C D H S }
    	i = 1
	    rank.each do |rank|
	    suit.each do |suit|
	        @cards << Card.new({:index => i, :suit => suit, :rank => rank, :pic => "#{rank}#{suit}.png"})
	        i += 1
	        end
	    end
	    @cards.shuffle!
	end
end