class Property < ApplicationRecord
  has_many :apartments
  has_many :tenants, through: :apartments
  belongs_to :landlord
end
