# Minimal serializer for narration when embedded (e.g. in Conclusion).
# Includes hadith_book and hadith_collection so the frontend can link to the hadith book.
# Includes english, arabic, annotated_arabic for read-only display (e.g. on tag detail page).
class NarrationSerializer < ActiveModel::Serializer
  attributes :id, :position, :english, :arabic, :annotated_arabic

  attribute :hadith_book, if: :hadith_book?

  def hadith_book?
    object.hadith_book.present?
  end

  def hadith_book
    book = object.hadith_book
    {
      id: book.id,
      title: book.title,
      hadith_collection: book.hadith_collection ? {
        id: book.hadith_collection.id,
        title: book.hadith_collection.title
      } : nil
    }
  end
end
