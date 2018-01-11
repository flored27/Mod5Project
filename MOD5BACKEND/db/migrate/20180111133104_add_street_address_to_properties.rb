class AddStreetAddressToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :street_address, :string
  end
end
