class CreateShots < ActiveRecord::Migration[5.0]
  def change
    create_table :shots do |t|

      t.timestamps
    end
  end
end
