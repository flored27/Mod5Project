class Landlord < ApplicationRecord
  has_many :properties
  #not sure if it should be has many apartments, and then has many tenants through apartments
  
end
