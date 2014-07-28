class Player < ActiveRecord::Base

	has_and_belongs_to_many :tables
	has_and_belongs_to_many :cards

	def compute_hand
		hand = []
		self.cards.each {|c| hand << c}
		self.tables.last.board.cards.each {|c| hand << c} 
		Evaluator.make_best(hand)
	end
	
end	