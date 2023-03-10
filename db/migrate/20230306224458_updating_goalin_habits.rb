class UpdatingGoalinHabits < ActiveRecord::Migration[6.1]
  def change
    remove_column :habits, :goal_frequenc
    add_column :habits, :goal_frequency, :integer, null: false
  end
end
