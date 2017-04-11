class AddShowTimeToCheckins < ActiveRecord::Migration[5.0]
  def change
    add_column :checkins, :show_time, :boolean,
               { null: false, default: false, after: :public }
  end
end
