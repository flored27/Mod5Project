class Landlord < ApplicationRecord
  has_many :properties, dependent: :destroy
  # supposedly so that if you destroy a LL,
  # you also destroy the properties assigned to it
  has_many :apartments, through: :properties
  has_many :tenants, through: :apartments
  #not sure if it should be has many apartments, and then has many tenants through apartments
  validates :email, presence: true, uniqueness: true
  # so that users have to register with a new email
  has_secure_password #to encrypt passwords
end
