class RemoveFeeFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :fee, :integer
  end
end
