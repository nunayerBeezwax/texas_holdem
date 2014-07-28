class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
    	t.string :suit
    	t.integer :rank
    	t.integer :index
    end

    create_table :cards_tables, id: false do |t|
    	t.belongs_to :card
    	t.belongs_to :table
    end
  end
end
