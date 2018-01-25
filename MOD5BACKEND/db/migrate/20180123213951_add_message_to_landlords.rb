class AddMessageToLandlords < ActiveRecord::Migration[5.1]
  def change
    add_column :landlords, :message, :string
  end
end
