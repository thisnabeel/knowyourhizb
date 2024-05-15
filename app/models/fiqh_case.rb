class FiqhCase < ActiveRecord::Base
  belongs_to :fiqh_case
  has_many :fiqh_case_principles
end
