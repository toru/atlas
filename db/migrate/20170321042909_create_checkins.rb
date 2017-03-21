class CreateCheckins < ActiveRecord::Migration[5.0]
  def up
    create_table :checkins, id: false do |t|
      t.string  :id, limit: 128
      t.integer :place_id, null: false
      t.boolean :public, null: false, default: false
      t.string  :comment

      t.timestamps
    end

    execute 'ALTER TABLE checkins ADD PRIMARY KEY (id);'
  end

  def down
    drop_table :checkins
  end
end
