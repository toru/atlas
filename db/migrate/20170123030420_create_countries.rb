class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string :alternate_id, null: false, limit: 64
      t.string :code
      t.string :name
      t.string :common_name

      t.timestamps
    end

    add_index :countries, :alternate_id, unique: true
  end
end
