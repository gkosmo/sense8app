class CreateProfileclusters < ActiveRecord::Migration[5.1]
  def change
    create_table :profileclusters do |t|
      t.references :profile, foreign_key: true
      t.references :cluster, foreign_key: true

      t.timestamps
    end
  end
end
