json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :subject, :content
  json.url feedback_url(feedback, format: :json)
end
