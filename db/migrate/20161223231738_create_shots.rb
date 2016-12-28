class CreateShots < ActiveRecord::Migration[5.0]
  def change
    create_table :shots do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :darts, array: true, default: []
      t.timestamps
    end
  end
end
