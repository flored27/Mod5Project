class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.integer :number
      t.belongs_to :tenant, index: true
      t.belongs_to :property, index: true

      t.timestamps
    end
  end
end
