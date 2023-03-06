class CreateHabits < ActiveRecord::Migration[6.1]
  def change
    create_table :habits do |t|
      t.string :title, null: false
      t.text :description
      t.string :habit_type, null: false
      t.string :frequency, null: false
      t.integer :goal_frequenc, null: false
      t.boolean :private, default: false
      t.float :current_progress, default: 0
      t.float :top_streak, default: 0
      t.references :owner, null: false, foreign_key: { to_table: :users }, index: true
      t.integer :steps_count, default: 0

      t.timestamps
    end
  end
end
