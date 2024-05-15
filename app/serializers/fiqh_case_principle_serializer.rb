class FiqhCasePrincipleSerializer < ActiveModel::Serializer
  attributes :id, :passing
  has_one :fiqh_principle

end
