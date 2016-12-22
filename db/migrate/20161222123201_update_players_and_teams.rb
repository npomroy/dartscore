class UpdatePlayersAndTeams < ActiveRecord::Migration[5.0]
  def change
    remove_column :players, :game_id
    add_column :teams, :game_id, :integer
  end
end
