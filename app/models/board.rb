class Board < ActiveRecord::Base
	belongs_to :table
	has_and_belongs_to_many :cards
end