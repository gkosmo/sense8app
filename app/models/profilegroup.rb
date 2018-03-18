class Profilegroup < ApplicationRecord
  belongs_to :profile
  belongs_to :group
  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :group
end
