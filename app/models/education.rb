class Education < ApplicationRecord
  has_many :profiles, through: :education_to_profiles
  has_many :education_to_profiles,  dependent: :destroy
end
