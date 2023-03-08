json.extract! user,  :id, :username, :own_habits, :own_steps
#json.url step_url(user, format: :json)
#json.owner do
#  json.username step.owner.username
#end
json.own_steps do
  json.array! @user.own_steps, partial: "steps/step", as: :step
end
