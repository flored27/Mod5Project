class ChangeApartmentNumberToStringInApartments < ActiveRecord::Migration[5.1]
  def change
    change_column :apartments, :number, :string
    change_column :tenants, :apartment_number, :string
  end
end
