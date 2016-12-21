class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.integer :player3_id
      t.integer :player4_id
      t.integer :player5_id
      t.string :name
      t.integer :score
      t.integer :current_shooter
      t.boolean :is_away
      t.timestamps
    end
  end
end
