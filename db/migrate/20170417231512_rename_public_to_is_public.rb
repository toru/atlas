class RenamePublicToIsPublic < ActiveRecord::Migration[5.0]
  def change
    rename_column :checkins, :public, :is_public
  end
end
