# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  Property.create(city: Faker::Address.city,
                  street_address: Faker::Address.street_address,
                  zip: Faker::Address.zip,
                  state: Faker::Address.state,
                  taxes: Faker::Number.number(5),
                  mortgage: Faker::Number.number(5)
                  )
end

20.times do
  Tenant.create(name: Faker::Name.name,
                age: Faker::Number.number(2),
                phone: Faker::Number.number(10),
                email: Faker::Internet.email
                )
end

20.times do
  Apartment.create(number: Faker::Number.number(2),
                  tenant_id: Faker::Number.number(1),
                  property_id: Faker::Number.number(1)
                  )
end

20.times do
  Landlord.create(name: Faker::Name.name,
                  email: Faker::Internet.email,
                  phone: Faker::Number.number(10)
                  )
end
