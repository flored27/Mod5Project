class AddApartmentToTenants < ActiveRecord::Migration[5.1]
  def change
    add_reference :tenants, :apartment, foreign_key: true
  end
end
