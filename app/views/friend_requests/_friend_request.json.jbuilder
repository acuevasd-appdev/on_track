json.extract! friend_request, :id, :recipient_id, :sender_id, :status, :created_at, :updated_at
json.url friend_request_url(friend_request, format: :json)
json.recipient do
  json.username friend_request.recipient.username
end
json.sender do
  json.username friend_request.sender.username
end
