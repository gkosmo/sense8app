class ChangeNotificationStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :counter, :bigint
  end
end
