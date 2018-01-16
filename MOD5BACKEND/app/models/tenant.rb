class Tenant < ApplicationRecord
  has_one :apartment
  has_one :property, through: :apartment
  #not sure if tenant belongs to or has one landlord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
