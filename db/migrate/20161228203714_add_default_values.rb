class AddDefaultValues < ActiveRecord::Migration[5.0]
  def change
    change_column_default :teams, :current_shooter, 0
    change_column_default :teams, :is_away, false
    change_column_default :players, :is_away, false
    change_column_default :players, :best_shot, 0
    change_column_default :games, :playing, false
  end
end
