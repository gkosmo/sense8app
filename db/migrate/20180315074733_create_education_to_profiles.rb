class CreateEducationToProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :education_to_profiles do |t|
      t.references :education, foreign_key: true
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
