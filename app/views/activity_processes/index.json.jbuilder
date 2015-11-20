json.array!(@activity_processes) do |activity_process|
  json.extract! activity_process, :id, :SelectiveProcess_id, :name_activity, :responsible_activity, :deadline_activity
  json.url activity_process_url(activity_process, format: :json)
end
