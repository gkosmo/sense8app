class ClusterRoomsChannel < ApplicationCable::Channel
  def subscribed
       stream_from "cluster_room_#{params[:cluster_room_id]}"
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
