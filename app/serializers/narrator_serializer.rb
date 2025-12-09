class NarratorSerializer < ActiveModel::Serializer
  attributes :id, :name, :scholar_index, :grade, :parents, :spouse, :siblings, :children,
             :birth_date_place, :places_of_stay, :death_date_place, :teachers, :students,
             :area_of_interest, :tags, :books, :birth_place, :birth_date, :birth_date_gregorian,
             :birth_date_hijri, :death_date_hijri, :death_date_gregorian, :death_place, :death_reason

  has_many :tidbits
  attribute :narrations, if: :include_narrations?

  def include_narrations?
    options = instance_options[:serializer_options] || instance_options
    options[:include_narrations] == true
  end

  def narrations
    narrator_narrations = object.narrator_narrations
      .includes(narration: [:hadith_chapter, hadith_book: :hadith_collection])
      .where.not(narration_id: nil)
    
    narrator_narrations.map do |nn|
      next if nn.narration.nil?
      
      {
        id: nn.narration.id,
        arabic: nn.narration.arabic,
        english: nn.narration.english,
        annotated_arabic: nn.narration.annotated_arabic,
        position: nn.position,
        context_name: nn.context_name,
        hadith_chapter: nn.narration.hadith_chapter ? {
          id: nn.narration.hadith_chapter.id,
          title: nn.narration.hadith_chapter.title
        } : nil,
        hadith_book: nn.narration.hadith_book ? {
          id: nn.narration.hadith_book.id,
          title: nn.narration.hadith_book.title,
          hadith_collection: nn.narration.hadith_book.hadith_collection ? {
            id: nn.narration.hadith_book.hadith_collection.id,
            title: nn.narration.hadith_book.hadith_collection.title
          } : nil
        } : nil
      }
    end.compact
  end
end

