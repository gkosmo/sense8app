class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  before_action :check_profile
  def home
  end
end
