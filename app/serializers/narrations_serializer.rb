class NarrationsSerializer < ActiveModel::Serializer
  attributes :id, :narrators, :annotated_arabic, :arabic

  def narrators
    object.narrator_narrations.where(language: "arabic").order("position ASC")
  end
end
