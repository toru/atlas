class AddLatlngToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :latitude,  :decimal, precision: 8, scale: 6, after: :url
    add_column :places, :longitude, :decimal, precision: 9, scale: 6, after: :latitude
  end
end
