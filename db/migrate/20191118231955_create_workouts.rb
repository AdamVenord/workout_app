class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :time
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
