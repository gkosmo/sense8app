class ClustersController < ApplicationController
  def show
    set_cluster
    check_cluster
    @group = Group.new
    @message = Message.new


 respond_to do |format|
    unless params[:messages].nil?
        @group = Group.find(params[:messages].to_i)
        @messages = @group.messages.order(created_at: :asc)
        current_user.group_notification(@group).update(counter: 0)
        format.js
      else
        format.js
        format.html
    end
  end

  end
  def cluster_message
    @cluster =Cluster.find(params[:cluster_id])
     @message = Message.new(user: current_user,messageable: @cluster, body: message_params[:body] )
     @message.save!
  end
  def get_cluster_online
       @cluster =Cluster.find(params[:cluster_id])
        users = []
        @cluster.profiles.each do |p|
            users << p.user if p.user.is_online?
        end
        p users
        render json: users
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
