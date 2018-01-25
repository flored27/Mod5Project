class AddApartmentNumberToTenants < ActiveRecord::Migration[5.1]
  def change
    add_column :tenants, :apartment_number, :integer
  end
end
