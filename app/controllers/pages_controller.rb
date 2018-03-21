class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if current_user
      profile = current_user.profile
      if profile.cluster.nil?
        redirect_to profile_path(profile)
      else
        redirect_to cluster_path(profile.cluster)
      end
    end
  end
end
