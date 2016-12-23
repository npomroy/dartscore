class ChangePlayerIdsToArray < ActiveRecord::Migration[5.0]
  def change
    remove_column :teams, :player1_id
    remove_column :teams, :player2_id
    remove_column :teams, :player3_id
    remove_column :teams, :player4_id
    remove_column :teams, :player5_id
    add_column :teams, :player_ids, :integer, array: true, default: []
  end
end
