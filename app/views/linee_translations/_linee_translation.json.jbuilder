json.extract! linee_translation, :id, :belongs_to, :language, :content, :content_explanation, :grammar_explanation, :created_at, :updated_at
json.url linee_translation_url(linee_translation, format: :json)
