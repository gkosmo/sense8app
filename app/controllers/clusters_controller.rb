class ClustersController < ApplicationController
  def show
    set_cluster
    check_cluster
    @message = Message.new
  end
  def cluster_message
    @cluster =Cluster.find(params[:cluster_id])
     @message = Message.new(user: current_user,messageable: @cluster, body: message_params[:body] )
     @message.save!
  end
  private
  def set_cluster
    @cluster = Cluster.find(params[:id])
  end
  def check_cluster
    redirect_to root_path unless current_user.profile.cluster == @cluster
  end

  def message_params
      params.require(:message).permit(:body)
    end
end
