class AddLandlordIdToTenant < ActiveRecord::Migration[5.1]
  def change
    add_column :tenants, :landlord_id, :integer
  end
end
