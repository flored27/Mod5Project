class Tenant < ApplicationRecord
  has_one :apartment
  has_one :property, through: :apartment
  #not sure if tenant belongs to or has one landlord
end
