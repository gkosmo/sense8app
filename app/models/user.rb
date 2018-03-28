class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :profile, optional: true, dependent: :destroy
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messageable
  has_many :notifications

  def group_notification(group)
      notifs = self.notifications.includes(:group).select {|notif|  notif.group == group }
      notif = notifs.empty? ? Notification.create(user: self, group: group, counter: 0)   : notifs[0]

  end

  def is_online?
     last_seen_at > 5.minutes.ago
  end
end
