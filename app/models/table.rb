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
		self.button.on = self.players.map{|p| p.seat.number}.sample
	end

	def get_active_players
		self.players.select{|p| p.chips > 0}
	end

	def deal
		i = 0
		until self.cards.count == self.players.count*2
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

	def table_state
		state = {}
		state[:button] = self.button.on
		state[:players] = self.players
		state[:board] = self.board.cards
		state
	end

	def json_deal
		deal = {}
		self.players.each do |player|
			deal.merge!(player.seat.number => [player.cards[0], player.cards[1]])
		end
		deal
	end

	def flop
		the_deal = []
		until self.board.cards.count == 3
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
		until self.board.cards.count == 4 
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
		until self.board.cards.count == 5 
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