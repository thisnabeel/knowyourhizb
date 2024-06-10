json.extract! line_translation, :id, :line_id, :language, :content, :content_explanation, :grammar_explanation, :created_at, :updated_at
json.url line_translation_url(line_translation, format: :json)
