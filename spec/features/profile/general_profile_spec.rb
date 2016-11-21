require 'spec_helper'
require 'rails_helper'

feature 'General profile:' do
    
    before(:each) do
        user = FactoryGirl.create(:user)
        login_as(user, :scope => :user)
        visit "/dashboard"
    end
    
    scenario 'all side panel elements are present after logging in' do
        expect(page).to have_content('Dashboard')
        expect(page).to have_content('Properties')
        expect(page).to have_content('Repairs')
        expect(page).to have_content('Bank')
        expect(page).to have_content('Settings')
    end
    
end