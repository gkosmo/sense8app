class Cluster < ApplicationRecord
  has_many :profileclusters
  has_many :profiles, through: :profileclusters
  def self.create_or_find_cluster(current_user)
     clusters = Cluster.where(birth_date: current_user.profile.birth_date)
     if clusters.empty?
        cluster = Cluster.create(birth_date: current_user.profile.birth_date)
        cluster.profiles << current_user.profile
        cluster.save!
        return cluster
     else
        clusters.each do |cluster|
           if cluster.profiles.size < 8
             cluster.profiles << current_user.profile
             cluster.save!
             return cluster
           end
        end
           cluster = Cluster.create(birth_date: current_user.profile.birth_date)
        cluster.profiles << current_user.profile
        cluster.save
        return cluster
     end
  end
end
