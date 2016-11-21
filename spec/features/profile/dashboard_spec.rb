require 'spec_helper'
require 'rails_helper'

feature 'Dashboard:' do
    
    before(:each) do
        @user = FactoryGirl.create(:user)
        login_as(@user, :scope => :user)
        visit "/dashboard"
    end
    
    scenario 'basic user information is displayed' do
        expect(page).to have_content(@user.email)
        expect(page).to have_content(@user.phone_number)
    end
    
end