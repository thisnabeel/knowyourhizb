json.extract! scripture, :id, :title, :body, :position, :created_at, :updated_at
json.url scripture_url(scripture, format: :json)
json.tree scripture.try(:cult).try(:tree) 
