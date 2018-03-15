class CreateHobbyToProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :hobby_to_profiles do |t|
      t.references :hobby, foreign_key: true
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
