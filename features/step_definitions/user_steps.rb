Given "I am on the HomeEase homepage" do
    visit 'visitors#index'
end

When /^I have attempted to register the user "(.*?)" "(.*?)" with email "(.*?)" and password "(.*?)" $/ do |firstName, lastName, email, password|
  visit 'users/new_user'
  fill_in 'user_first_name', :with => firstName
  fill_in 'user_last_name', :with => lastName
  fill_in 'user_email', :with => email
  fill_in 'user_phone_number', :with => '123-456-7890'
  fill_in 'user_password', :with => password
  fill_in 'user_password_confirmation', :with => password
  click_button 'Sign up'
end

Then /^I should be signed in as "(.*?)" "(.*?)"$/ do |firstName, lastName| 
  visit "dashboard"
  expect(page).to have_content(firstName)
  expect(page).to have_content(lastName)
end

When /^I have attempted to sign in the user with email "(.*?)" and password "(.*?)" $/ do |email, password|
  visit 'users/sign_in'
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => password
  click_button 'Sign in'
end

Then /^I should be signed in with the email "(.*?)"$/ do |email| 
  visit "dashboard"
  expect(page).to have_content(email)
end

Then /^I should be able to view my properties$/ do
  visit "dashboard"
  click_on "Repairs"
  expect(page).to have_content("Maintenance Issues page")
end
