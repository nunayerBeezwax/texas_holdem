class Player < ActiveRecord::Base

	has_many :seats
	has_many :tables, through: :seats
	has_and_belongs_to_many :cards

	def sit(t, s)	
		Seat.create(number: s, table_id: t.id, player_id: self.id)
	end

	def compute_hand
		hand = []
		self.cards.each {|c| hand << c}
		self.tables.last.board.cards.each {|c| hand << c} 
		Evaluator.make_best(hand)
	end
	
end	