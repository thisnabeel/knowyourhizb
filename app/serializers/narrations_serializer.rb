class NarrationsSerializer < ActiveModel::Serializer
  attributes :id, :narrators, :annotated_arabic, :arabic, :english
  attributes :chapter, :book, :conclusions


  def options
    instance_options[:serializer_options]
  end

  def narrators
    if options && options[:show_full]
      if object.narrator_narrations
        narrator_narrations = object.narrator_narrations.where(language: "arabic").order("position ASC")
        return ActiveModel::Serializer::CollectionSerializer.new(
          narrator_narrations, 
          serializer: NarratorNarrationSerializer
        )
      else
        return []
      end
    else
      return []
    end
  end

  def chapter
    object.hadith_chapter
  end

  def book
    object.hadith_book
  end

  def conclusions
    if options && options[:show_full]
      object.conclusions.order("position ASC")
    else
      return []
    end
  end
  
  def collection
    object.hadith_book.hadith_collection
  end
end
