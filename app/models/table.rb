class Table < ActiveRecord::Base

	has_and_belongs_to_many :players
	has_and_belongs_to_many :cards
	has_one :board

	after_create :setup 

	def setup
		self.board = Board.create
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
		until self.cards.count == 23
			card = Card.find(rand(1..52))
			if !self.cards.include?(card)
				self.cards << card
				self.board.cards << card
				the_deal << card
			end
		end
		the_deal
	end	

	def turn
		the_deal = []
		until self.cards.count == 24 
			card = Card.find(rand(1..52))
			if !self.cards.include?(card)
				self.cards << card
				self.board.cards << card
				the_deal << card
			end
		end
		the_deal
	end	

	def river
		the_deal = []
		until self.cards.count == 25 
			card = Card.find(rand(1..52))
			if !self.cards.include?(card)
				self.cards << card
				self.board.cards << card
				the_deal << card
			end
		end
		the_deal	
	end

	def winner 
		results = {}
		self.players.each do |player|
			results.merge! player.id => player.compute_hand
		end
		results
	end

	def clear
		self.cards = []
		self.board.cards = []
		self.players.each {|p| p.cards = []}
	end
end