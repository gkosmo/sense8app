class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.string :title
      t.string :description
      t.string :organisation

      t.timestamps
    end
  end
end
