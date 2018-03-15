class CreateLanguageToProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :language_to_profiles do |t|
      t.references :profile
      t.references :language

      t.timestamps
    end
  end
end
