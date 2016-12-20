class UpdatePlayers < ActiveRecord::Migration[5.0]
  def change
    rename_column :players, :record, :gamestats
  end
end
