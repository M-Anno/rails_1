class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :room_introduction
      t.integer :fee
      t.string :address
      t.string :image
      t.integer :people
      t.date :created_date

      t.timestamps
    end
  end
end
