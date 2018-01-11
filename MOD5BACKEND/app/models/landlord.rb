class Landlord < ApplicationRecord
  has_many :properties
  has_many :apartments, through: :properties
  has_many :tenants, through: :apartments
  #not sure if it should be has many apartments, and then has many tenants through apartments

end
