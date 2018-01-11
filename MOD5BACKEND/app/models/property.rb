class Property < ApplicationRecord
  has_many :apartments
  has_many :tenants, through: :apartments
end
