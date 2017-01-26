class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.integer :country_id
      t.string  :slug, limit: 64, null: false
      t.string  :name

      t.timestamps
    end

    add_index :cities, :slug, unique: true
    add_index :cities, :country_id
  end
end
