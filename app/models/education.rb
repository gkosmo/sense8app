class Education < ApplicationRecord
  has_many :education_to_profiles,  dependent: :destroy
end
