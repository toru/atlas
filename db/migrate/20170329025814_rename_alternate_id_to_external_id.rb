class RenameAlternateIdToExternalId < ActiveRecord::Migration[5.0]
  def change
    rename_column :places, :alternate_id, :external_id
  end
end
