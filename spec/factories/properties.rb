FactoryGirl.define do
  factory :property do
    street '123 Clinton Street'
    city 'Iowa City'
    state 'Iowa'
    zipcode '12345'
    price '2000.00'
    bedrooms '3'
    bathrooms '2'
    description 'For testing purposes'
    amenities 'electricity'
  end
end
