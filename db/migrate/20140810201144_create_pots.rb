class CreatePots < ActiveRecord::Migration
  def change
    create_table :pots do |t|
    	t.belongs_to :table
    	t.integer :chips
    end
  end
end
