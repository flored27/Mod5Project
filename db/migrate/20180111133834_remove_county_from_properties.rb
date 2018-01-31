class RemoveCountyFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :county, :string
  end
end
