class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :game_id
      t.string :name
      t.boolean :on_team1
      t.boolean :is_away
      t.string :record
      t.integer :best_shot
    end
  end
end
