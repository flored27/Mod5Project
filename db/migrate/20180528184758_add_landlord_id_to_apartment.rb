class AddLandlordIdToApartment < ActiveRecord::Migration[5.1]
  def change
    add_column :apartments, :landlord_id, :integer
  end
end
