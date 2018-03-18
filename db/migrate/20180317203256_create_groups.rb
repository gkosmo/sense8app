class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.references :cluster, foreign_key: true

      t.timestamps
    end
  end
end
