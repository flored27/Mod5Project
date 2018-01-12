class Property < ApplicationRecord
  has_many :apartments, dependent: :destroy
  # apparently so that when you destroy a property, 
  # you destroy the apartment/tenant info too
  has_many :tenants, through: :apartments, dependent: :destroy
  belongs_to :landlord
end
