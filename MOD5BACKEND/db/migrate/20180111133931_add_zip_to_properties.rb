class AddZipToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :zip, :string
  end
end
