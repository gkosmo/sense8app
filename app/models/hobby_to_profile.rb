class HobbyToProfile < ApplicationRecord
  belongs_to :hobby
  belongs_to :profile
  accepts_nested_attributes_for :profile
end
