class Cluster < ApplicationRecord
  has_many :messages, as: :messageable
  has_many :profileclusters
  has_many :profiles, through: :profileclusters

  def messages
      Message.includes(:user).where(messageable: self)

  end
  def self.create_or_find_cluster(profile)
     clusters = Cluster.where(birth_date: profile.birth_date)
     if clusters.empty?
        cluster = Cluster.create(birth_date: profile.birth_date)
        cluster.profiles << profile
        cluster.save!
        return cluster
     else
        clusters.each do |cluster|
           if cluster.profiles.size < 8
             cluster.profiles << profile
             cluster.save!
             return cluster
           end
        end
           cluster = Cluster.create(birth_date: profile.birth_date)
        cluster.profiles << profile
        cluster.save
        return cluster
     end
  end
end
