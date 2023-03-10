json.extract! step, :id, :caption, :image, :comments_count, :supports_count, :habit_id, :date_completion, :created_at, :updated_at, :like_supports, :love_supports, :celebrate_supports
json.url step_url(step, format: :json)
json.owner do
  json.username step.owner.username
end
json.supports do
  json.array! step.supports, partial: "supports/support", as: :support
end
json.habit do
  json.title step.habit.title
end
