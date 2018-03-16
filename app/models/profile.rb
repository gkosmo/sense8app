class Profile < ApplicationRecord
  belongs_to :user
  has_many :profilecluster
  has_many :clusters,through: :profilecluster
  has_many :education_to_profile
  has_many :educations, through: :education_to_profile
  has_many :hobby_to_profile
  has_many :hobbies, through: :hobby_to_profile
  has_many :language_to_profiles
  has_many :languages, through: :language_to_profiles
  validates :birth_place, presence: true
  validates :birth_date, presence: true
  validates :nickname, presence: true
  validates :living_place, presence: true
  validates :gender, presence: true, inclusion: {in: ["male","female", "other"]}
  validates :gender_identity, presence: true,inclusion: { in: ["male","female", "other"] }
  validates :sexuality, presence: true,inclusion: { in: ["hetero", "lesbian", "gay", "trans", "bi", "questionning", "investigating", "queer", "other"] }
  after_validation :geocode_birth_and_living

   accepts_nested_attributes_for :hobby_to_profile

  def self.genders
    ["male","female", "other"]
  end

  def self.sexualities
    ["hetero", "lesbian", "gay", "trans", "bi", "questionning", "investigating", "queer", "other"]
  end
  def cluster
      self.clusters.first
  end
  private

  def geocode_birth_and_living
    self.birth_place_latitude, self.birth_place_longitude = Geocoder.coordinates(birth_place)
    self.living_place_latitude, self.living_place_longitude = Geocoder.coordinates(living_place)
    self.save(validate: false)
    # same for work
  end
end

