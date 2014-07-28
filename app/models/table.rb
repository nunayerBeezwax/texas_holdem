class Table < ActiveRecord::Base

	has_and_belongs_to_many :players
	has_and_belongs_to_many :cards

	attr_reader :deck, :board
	after_create :setup 

	def setup
		@board = []
		10.times { self.players << Player.create({name: Faker::Name.first_name, chips: 1000}) }
	end

	def deal
		i = 0
		the_deal = []
		until self.cards.count == 20
			card = Card.find(rand(1..52))
			if !self.cards.include?(card)
				self.cards << card
				the_deal << card
				self.players[i].cards << card
				if self.players[i].cards.count == 2
					i += 1
				end
			end
		end
		the_deal
	end	

	def flop
		the_deal = []
		until the_deal.length == 3 
			card = Card.find(rand(1..52))
			the_deal << card unless self.cards.include?(card)
		end
		the_deal
	end	

	def turn
		@deck.cards.shift
	end	

	def river
		@deck.cards.shift
	end	

	def clear
		self.cards = []
		self.players.each {|p| p.cards = []}
	end
end