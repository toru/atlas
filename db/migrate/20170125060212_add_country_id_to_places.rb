class AddCountryIdToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :country_id, :integer, after: :alternate_id
  end
end
