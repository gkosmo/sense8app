class AddBirthDateToCluster < ActiveRecord::Migration[5.1]
  def change
    add_column :clusters, :birth_date, :date
  end
end
