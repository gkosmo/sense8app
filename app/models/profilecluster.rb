class Profilecluster < ApplicationRecord
  belongs_to :profile
  belongs_to :cluster
  validates :profile, uniqueness: true
end
