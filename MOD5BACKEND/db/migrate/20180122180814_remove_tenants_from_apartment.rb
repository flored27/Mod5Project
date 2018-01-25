class RemoveTenantsFromApartment < ActiveRecord::Migration[5.1]
  def change
    remove_reference( :apartments, :tenant, index: true)
  end
end
