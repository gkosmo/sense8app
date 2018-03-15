class Hobby < ApplicationRecord
  has_many :hobby_to_profiles, dependent: :destroy
  has_many :profiles, through: :hobby_to_profiles
end
