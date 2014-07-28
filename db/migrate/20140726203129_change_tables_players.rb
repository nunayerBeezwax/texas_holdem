class ChangeTablesPlayers < ActiveRecord::Migration
  def change
  	rename_table :tables_players, :players_tables
  end
end
