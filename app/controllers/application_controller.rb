class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  def check_profile
  #   if !current_user.profile.nil?
  #   redirect_to profile_new
  # end
  end
end
