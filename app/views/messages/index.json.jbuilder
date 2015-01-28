json.array!(@messages) do |message|
  json.extract! message, :id, :schedule_date, :subject, :body
  json.url message_url(message, format: :json)
end
