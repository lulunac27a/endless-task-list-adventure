class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :level
      t.float :xp
      t.float :xp_required
      t.float :total_xp

      t.timestamps
    end
  end
end
