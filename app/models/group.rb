class Group < ApplicationRecord
  belongs_to :cluster
  has_many :messages, as: :messageable
  has_many :profilegroups, dependent: :destroy
  has_many :profiles, through: :profilegroups
  accepts_nested_attributes_for :profilegroups
  accepts_nested_attributes_for :profiles
  validate :group_exists , on: :create
  has_many :notifications



  def group_exists
    groups =  Group.where(cluster: cluster)

    groups.each do |g|
        errors.add(:group, "group already exists") if g.profiles - profiles == profiles - g.profiles && g.profiles.length == profiles.length
    end
  end

end
