class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :room
      t.references :user
      t.integer :fee
      t.date :start_date
      t.date :end_date
      t.integer :people
      t.integer :days
      t.integer :total

      t.timestamps
    end
  end
end
