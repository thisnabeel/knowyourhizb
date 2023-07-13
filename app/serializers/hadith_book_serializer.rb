class HadithBookSerializer < ActiveModel::Serializer
  attributes :id, :hadith_chapters, :narrations

  def chapters
    object.hadith_chapters.order("position ASC")
  end

  def narrations  
    ActiveModel::Serializer::CollectionSerializer.new(
      object.narrations.order("position ASC"), serializer: NarrationsSerializer)
  end
  
end
