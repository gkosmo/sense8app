class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
    def i_am_still_here
        current_user.update_attribute(:last_seen_at, Time.current)
        head 200, content_type: "text/html"
    end

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
