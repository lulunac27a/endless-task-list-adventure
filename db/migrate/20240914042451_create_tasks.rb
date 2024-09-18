class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :due_date
      t.integer :repeat_interval
      t.string :repeat_frequency

      t.timestamps
    end
  end
end
