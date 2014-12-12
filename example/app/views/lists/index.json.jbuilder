json.array!(@lists) do |list|
  json.extract! list, :id, :name, :index, :sortable_id, :content
  json.url list_url(list, format: :json)
end
