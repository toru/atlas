class CreatePlaceDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :place_details do |t|
      t.integer :place_id, null: false
      t.string  :locale, limit: 16
      t.string  :name

      t.timestamps
    end

    add_index :place_details, [:place_id, :locale], unique: true
  end
end
