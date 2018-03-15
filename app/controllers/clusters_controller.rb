class ClustersController < ApplicationController
  before_action :check_profile
  def show
    @cluster = Cluster.find(params[:id])
  end
end
