class LineTranslationSerializer < ActiveModel::Serializer
  attributes :id, :language, :content, :content_explanation, :grammar_explanation
  has_one :line
end
