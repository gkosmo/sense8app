class AddOnlineToUser < ActiveRecord::Migration[5.1]
  def change
        add_column :users, :online, :boolean, default: false
  end
end
