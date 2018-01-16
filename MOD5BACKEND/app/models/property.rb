class Property < ApplicationRecord
  has_many :apartments, dependent: :destroy
  # apparently so that when you destroy a property,
  # you destroy the apartment/tenant info too
  has_many :tenants, through: :apartments, dependent: :destroy
  belongs_to :landlord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
