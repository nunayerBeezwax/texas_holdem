class CreateButtons < ActiveRecord::Migration
  def change
    create_table :buttons do |t|
    	t.belongs_to :table
    	t.integer :on
    end
  end
end
