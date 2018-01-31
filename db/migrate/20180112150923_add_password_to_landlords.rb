class AddPasswordToLandlords < ActiveRecord::Migration[5.1]
  def change
    add_column :landlords, :password_digest, :string
  end
end
