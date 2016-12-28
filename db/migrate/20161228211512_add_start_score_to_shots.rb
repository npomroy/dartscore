class AddStartScoreToShots < ActiveRecord::Migration[5.0]
  def change
    add_column :shots, :start_score, :integer
  end
end
