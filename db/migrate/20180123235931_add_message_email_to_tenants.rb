class AddMessageEmailToTenants < ActiveRecord::Migration[5.1]
  def change
    add_column :tenants, :message_email, :string
  end
end
