json.array! @friends_sent , partial: "friend_requests/friend_request", as: :friend_request
json.array! @friends_received , partial: "friend_requests/friend_request", as: :friend_request
