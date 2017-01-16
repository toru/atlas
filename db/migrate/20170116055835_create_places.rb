class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :alternate_id, null: false, limit: 64
      t.string :url

      t.timestamps
    end

    add_index :places, :alternate_id, unique: true
  end
end
