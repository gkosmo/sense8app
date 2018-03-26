class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :profile, optional: true, dependent: :destroy
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messageable
  def is_online?
     last_seen_at > 5.minutes.ago
  end
end
