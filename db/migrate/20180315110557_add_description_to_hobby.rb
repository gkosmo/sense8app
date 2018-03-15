class AddDescriptionToHobby < ActiveRecord::Migration[5.1]
  def change
    add_column :hobbies, :description, :string
  end
end
