class NarrationsSerializer < ActiveModel::Serializer
  attributes :id, :narrators, :annotated_arabic, :arabic
  attributes :chapter, :book
  def narrators
    object.narrator_narrations.where(language: "arabic").order("position ASC")
  end

  def chapter
    object.hadith_chapter
  end

  def book
    object.hadith_book
  end

  def collection
    object.hadith_book.hadith_collection
  end
end
