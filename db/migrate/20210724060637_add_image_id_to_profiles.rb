class AddImageIdToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :image_id, :string
  end
end
