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
  click_button 'Save Changes'
end

Then /^I should see a movie list entry with title "(.*?)" and rating "(.*?)"$/ do |title, rating| 
  result=false
  all("tr").each do |tr|
    if tr.has_content?(title) && tr.has_content?(rating)
      result = true
      break
    end
  end  
  expect(result).to be_truthy
end