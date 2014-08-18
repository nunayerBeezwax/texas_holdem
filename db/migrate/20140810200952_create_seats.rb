class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
    	t.belongs_to :table
    	t.integer :number
    end
  end
end
