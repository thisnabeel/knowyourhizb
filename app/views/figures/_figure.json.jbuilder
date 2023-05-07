json.extract! figure, :id, :title, :body, :position, :created_at, :updated_at
json.tree figure.try(:cult).try(:tree) 
json.url figure_url(figure, format: :json)
