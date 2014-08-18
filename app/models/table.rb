class Table < ActiveRecord::Base

	has_one :board
	has_one :button
	has_one :pot
	has_and_belongs_to_many :cards
	has_many :seats
	has_many :players, through: :seats

	after_create :setup 

	def setup
		self.board = Board.create
		self.pot = Pot.create
		self.button = Button.create
	end

	def get_active_players
		self.players.select{|p| p.chips > 0}
	end

	def deal
		players_in_hand = get_active_players
		#button
		i = button+1 || 0
		until self.cards.count == players_in_hand.count*2
			card = Card.find(rand(1..52))
			if !self.cards.include?(card)
				self.cards << card
				self.players[i].cards << card
				if self.players[i].cards.count == 2
					i += 1
				end
			end
		end
		json_deal
	end	

	def json_deal
		deal = {}
		self.players.each do |player|
			deal.merge!(player => [player.cards[0], player.cards[1]])
		end
		deal
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