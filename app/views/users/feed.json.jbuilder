json.extract! @feed, :user
json.users do
  json.array! @feed.user, partial: "users/ownsteps", as: :user
end
