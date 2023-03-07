json.extract! @user, :id, :friends, :username, :own_habits, :own_steps
json.friends do
  json.array! @friends.own_steps, partial: "steps/step", as: :step
end
