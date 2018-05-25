class AddPropertyIdToTenant < ActiveRecord::Migration[5.1]
  def change
    add_column :tenants, :property_id, :integer
  end
end
