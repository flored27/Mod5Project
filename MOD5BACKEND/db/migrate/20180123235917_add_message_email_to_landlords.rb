class AddMessageEmailToLandlords < ActiveRecord::Migration[5.1]
  def change
    add_column :landlords, :message_email, :string
  end
end
