class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :team1_score
      t.integer :team1_shooting
      t.integer :team1_player_count
      t.integer :team2_score
      t.integer :team2_shooting
      t.integer :team2_player_count
      t.boolean :team1_up
      t.integer :starting_score
      t.boolean :playing
    end
  end
end
