class NarratorNarrationSerializer < ActiveModel::Serializer
  attributes :id, :narrator_id, :narration_id, :position, :context_name, :uuid, :language, :narrator

  def narrator
    if object.narrator_id.present? && object.narrator
      {
        id: object.narrator.id,
        name: object.narrator.name,
        death_date_gregorian: object.narrator.death_date_gregorian,
        death_date_hijri: object.narrator.death_date_hijri
      }
    else
      nil
    end
  end
end

