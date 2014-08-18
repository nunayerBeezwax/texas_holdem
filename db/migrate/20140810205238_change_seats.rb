class ChangeSeats < ActiveRecord::Migration
  def change
  	add_column :seats, :player_id, :integer
  end
end
