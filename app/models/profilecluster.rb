class Profilecluster < ApplicationRecord
  belongs_to :profile
  belongs_to :cluster
  accepts_nested_attributes_for :profile
  validates :profile, uniqueness: true
end
