# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = CreateAdminService.new.call


example_property = user.properties.create(street: '666 Fluffy Bunny Way', city: 'TooKuhl4School', 
    state: "Iowa" , zipcode: 52240, price: 2200, bedrooms: 3,bathrooms: 1, amenities: "Selt and Com nets", 
    description: "something descriptive would go here")
puts 'CREATED EXAMPLE PROPERTY: ' << example_property.street

kyles_house = user.properties.create(street: '670 South Governor', city: 'Iowa City', state: 'Iowa',
    zipcode: 52240, price: 2800, bedrooms: 6, bathrooms: 2, amenities: "chill room mates", 
    description: "they hate sweet sweet chocolate")
puts 'CREATED EXAMPLE PROPERTY: ' << kyles_house.street