class CreateCardsPlayers < ActiveRecord::Migration
  def change
    create_table :cards_players do |t|

    	t.belongs_to :card
    	t.belongs_to :player
    	
    end
  end
end
