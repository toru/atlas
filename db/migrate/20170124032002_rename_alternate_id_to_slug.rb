class RenameAlternateIdToSlug < ActiveRecord::Migration[5.0]
  def change
    rename_column :countries, :alternate_id, :slug
  end
end
