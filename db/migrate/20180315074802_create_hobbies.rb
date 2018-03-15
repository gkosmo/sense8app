class CreateHobbies < ActiveRecord::Migration[5.1]
  def change
    create_table :hobbies do |t|
      t.string :title
      t.string :proficiency

      t.timestamps
    end
  end
end
