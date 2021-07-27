class AddImageIdToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :image_id, :string
  end
end
