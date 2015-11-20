json.array!(@selective_processes) do |selective_process|
  json.extract! selective_process, :id, :name_process, :responsible, :deadline
  json.url selective_process_url(selective_process, format: :json)
end
