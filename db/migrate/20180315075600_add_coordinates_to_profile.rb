class AddCoordinatesToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :birth_place_latitude, :float
    add_column :profiles, :birth_place_longitude, :float
    add_column :profiles, :living_place_latitude, :float
    add_column :profiles, :living_place_longitude, :float
  end
end
