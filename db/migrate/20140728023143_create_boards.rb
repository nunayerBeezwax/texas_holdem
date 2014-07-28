class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
    	t.belongs_to :table
    end

    create_table :boards_cards do |t|
    	t.belongs_to :board
    	t.belongs_to :card
    end
  end
end
