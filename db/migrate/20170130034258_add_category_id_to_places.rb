class AddCategoryIdToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :category_id, :integer, after: :alternate_id
  end
end
