class AddTimestampsToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :created_at, :datetime
    add_column :games, :updated_at, :datetime
  end
end
