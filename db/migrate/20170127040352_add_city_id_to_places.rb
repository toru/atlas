class AddCityIdToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :city_id, :integer, after: :country_id
  end
end
