class Property < ApplicationRecord
  has_many :apartments, dependent: :destroy
  has_many :tenants, through: :apartments, dependent: :destroy
  belongs_to :landlord
end
