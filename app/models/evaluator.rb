class Evaluator

	### Constants

	ENGLISH = { 1 => "Ace", 2 => "Two", 3 => "Three", 4 => "Four", 
				5 => "Five", 6 => "Six", 7 => "Seven", 8 => "Eight", 
				9 => "Nine", 10 => "Ten", 11 => "Jack", 12 => "Queen", 
				13 => "King", 14 => "Ace" }

	HAND_TYPES = { 1 => 'high_card', 2 => 'pair', 3 => 'two_pair', 4 => 'three_of_a_kind',
				   5 => 'straight', 6 => 'flush', 7 => 'full_house', 8 => 'four_of_a_kind',
				   9 => 'straight_flush' }

	STRAIGHTS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14].each_cons(5)


	def Evaluator.make_best(hand)
		score = 0
		Evaluator::HAND_TYPES.each do |key, value|
			if eval("self.#{value}(hand)") == true
				score = key
			end
		end
		best_hand[score]
	end

	### Human-friendly best hand description for display to screen

	def self.display_evaluation(hand)
		type = make_best(hand)
		case type
		when 'high_card'
			Evaluator::ENGLISH[ranks(hand).sort.last] + " High"
		when 'pair'
		when 'two_pair'
		when 'three_of_a_kind'
		when 'straight'
		when 'flush'
		when 'full_house'
		when 'four_of_a_kind'
		when 'straight_flush'
		end
	end

	### TODO: Construct machine-friendly hand-weighting system for payouts

	### Hand && Card data extraction toolkit

	def self.ranks(hand)
		hand.map { |c| c.rank == 1 ? 14 : c.rank }
	end

	def self.multiples(ranks)
		rank_counts = []
		ranks.each { |num| rank_counts << ranks.count(num) }
		rank_counts
	end

	def self.suits(hand)
		hand.map { |c| c.suit }
	end

	### Boolean results of hand type discovery in hand token

	def self.high_card(hand)
		true
	end

	def self.pair(hand)
		multiples(ranks(hand)).include?(2)
	end

	def self.two_pair(hand)
		multiples(ranks(hand)).count(2) >= 4
	end

	def self.three_of_a_kind(hand)
		multiples(ranks(hand)).include?(3)
	end

	def self.straight(hand)
		ranks = ranks(hand).sort.uniq
		if ranks[0..3] == [2, 3, 4, 5] && ranks.include?(14)
			true
		elsif ranks.count == 5
			STRAIGHTS.include?(ranks)
		elsif ranks.count == 6
			STRAIGHTS.include?(ranks[0..4]) || STRAIGHTS.include?(ranks[1..5])
		elsif ranks.count == 7
			STRAIGHTS.include?(ranks[0..4]) || STRAIGHTS.include?(ranks[1..5]) || STRAIGHTS.include?(ranks[2..6])
		end
	end

	def self.flush(hand)
		suits = %w{ H S C D }
		suits.each do |s|
			return true if hand.count { |card| card.suit == s } >= 5
		end
		false
	end

	def self.full_house(hand)
		multiples(ranks(hand)).include?(3) && multiples(ranks(hand)).include?(2)
	end

	def self.four_of_a_kind(hand)
		multiples(ranks(hand)).include?(4)
	end

	def self.straight_flush(hand)
		## slightly flawed
		flush(hand) && straight(hand)		
	end
end