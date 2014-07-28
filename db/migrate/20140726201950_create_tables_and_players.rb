class CreateTablesAndPlayers < ActiveRecord::Migration
  def change
    create_table :tables do |t|
    	
    end
    create_table :players do |t|
    	t.string :name
    	t.integer :chips
    end
    create_table :tables_players, id: false do |t|
      t.belongs_to :table
      t.belongs_to :player
    end
  end
end
