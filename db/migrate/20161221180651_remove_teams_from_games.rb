class RemoveTeamsFromGames < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :team1_player_count
    remove_column :games, :team1_shooting
    remove_column :games, :team1_score
    remove_column :games, :team2_player_count
    remove_column :games, :team2_shooting
    remove_column :games, :team2_score
    remove_column :players, :on_team1
    add_column :players, :team_id, :integer
    add_column :games, :team1_id, :integer
    add_column :games, :team2_id, :integer
  end
end
