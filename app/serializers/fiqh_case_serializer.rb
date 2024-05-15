class FiqhCaseSerializer < ActiveModel::Serializer
  attributes :id, :title, :position, :description, :fiqh_case_principles
  has_one :fiqh_case

  def fiqh_case_principles
    object.fiqh_case_principles.map {|p| FiqhCasePrincipleSerializer.new(p)}
  end
end
