class Table < ActiveRecord::Base

	has_and_belongs_to_many :players

	attr_reader :deck, :board
	after_create :setup 

	def setup
		@board = []
		@deck = Deck.new
		10.times { self.players << Player.create({name: Faker::Name.first_name, chips: 1000}) }
	end

	def deal
		the_deal = []
		20.times {the_deal << Deck.new.cards.shift}
		the_deal
	end	

	def flop
		the_deal = []
		23.times {the_deal << @deck.cards.shift}
		the_deal
	end	

	def turn
		@deck.cards.shift
	end	

	def river
		@deck.cards.shift
	end	
end