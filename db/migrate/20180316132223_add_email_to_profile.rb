class AddEmailToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :email, :boolean
  end
end
