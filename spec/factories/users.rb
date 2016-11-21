FactoryGirl.define do
  factory :user do
    first_name "Test"
    last_name "User"
    email "test@example.com"
    phone_number "123456789"
    password "please123"
  end
end
