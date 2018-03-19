class GroupRoomsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
        stream_from "group_room_#{params[:group_room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
