class RenamePlaceDetailsToPlaceContents < ActiveRecord::Migration[5.0]
  def change
    rename_table :place_details, :place_contents
  end
end
