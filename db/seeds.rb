# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
example_property = Property.create(address: '666 Fluffy Bunny Way, TooKuhl4School',rent_amount: 2200, number_bedrooms: 3,number_bathrooms: 1)
puts 'CREATED EXAMPLE PROPERTY: ' << example_property.address
kyles_house = Property.create(address: '670 South Governor, Iowa City',rent_amount: 2800, number_bedrooms: 6,number_bathrooms: 2)
puts 'CREATED EXAMPLE PROPERTY: ' << kyles_house.address