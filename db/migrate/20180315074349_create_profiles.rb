class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :birth_place
      t.date :birth_date
      t.string :nickname
      t.string :living_place
      t.string :gender
      t.string :gender_identity
      t.string :sexuality

      t.timestamps
    end
  end
end
