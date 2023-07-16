class HadithBookSerializer < ActiveModel::Serializer
  attributes :id, :hadith_chapters, :narrations
  attributes :collection
  attributes :title

  def chapters
    object.hadith_chapters.order("position ASC")
  end

  def collection
    object.hadith_collection
  end

  def narrations  
    ActiveModel::Serializer::CollectionSerializer.new(
      object.narrations.order("position ASC"), serializer: NarrationsSerializer, 
      serializer_options: {
        show_full: false
      })
  end
  
end
