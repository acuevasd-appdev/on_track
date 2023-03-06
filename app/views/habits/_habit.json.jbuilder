json.extract! habit, :id, :title, :description, :habit_type, :frequency, :goal_frequency, :private, :current_progress, :top_streak, :owner_id, :steps_count, :created_at, :updated_at
json.url habit_url(habit, format: :json)
