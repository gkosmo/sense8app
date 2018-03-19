class GroupsController < ApplicationController
  def create
    @cluster = Cluster.find(params[:cluster_id].to_i)
    profiles = group_params[:profiles].reject{|p| p == ""}.map do |p|
          Profile.find(p.to_i)
    end
    profiles << current_user.profile
    @group=  Group.new(profiles: profiles)
    @group.cluster = @cluster

 respond_to do |format|
      if @group.save
        format.js
        format.html { redirect_to @cluster, notice: 'save' }
        format.json { render :show, status: :created, location: @profile }
      else

        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end


  end
 def group_message
    @group =Group.find(params[:group_id])
     @message = Message.new(user: current_user, messageable: @group, body: message_params[:body] )
     @message.save!
  end
private
  def message_params
      params.require(:message).permit(:body)
    end
  def group_params
      params.require(:group).permit(profiles:[])
  end
end
