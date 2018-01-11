class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.integer :taxes
      t.integer :mortgage
      t.string :location
      t.string :state
      t.string :county
      t.string :city

      t.timestamps
    end
  end
end
