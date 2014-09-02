class Player < ActiveRecord::Base

	has_one :seat
	has_one :table, through: :seat
	has_and_belongs_to_many :cards

	def sit(t, s)
		self.update(chips: 1000)	
		Seat.create(number: s, table_id: t.id, player_id: self.id)
	end

	def compute_hand
		hand = []
		self.cards.each {|c| hand << c}
		self.table.board.cards.each {|c| hand << c} 
		Evaluator.make_best(hand)
	end
	
end	