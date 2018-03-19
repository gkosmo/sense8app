class Message < ApplicationRecord
  belongs_to :user
  belongs_to :messageable, polymorphic: true
  after_create :broadcast_message


  def broadcast_message
    if messageable_type == "Cluster"
    ActionCable.server.broadcast("cluster_room_#{messageable_id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "clusters/message",
        locals: { message: self, user_is_messages_author: false }
      ),
      current_user_id: user.id
    })
    else
      ActionCable.server.broadcast("group_room_#{messageable_id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "clusters/message",
        locals: { message: self, user_is_messages_author: false }
      ),
      current_user_id: user.id
    })
    end
  end




end
