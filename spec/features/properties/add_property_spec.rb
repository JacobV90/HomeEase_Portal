require 'spec_helper'
require 'rails_helper'

feature 'Add property:' do
    
    before(:each) do
        user = FactoryGirl.create(:user)
        login_as(user, :scope => :user)
        visit "/dashboard"
    end
    
    scenario 'clicking on the "Add a property" tab opens a form to add a property' do
        click_on('Properties')
        click_on('Add a property')
        expect(page).to have_content("Bedrooms")
        expect(page).to have_content("Bathrooms")
    end
    
    scenario 'properties can be added and their information can be viewed' do
        property = FactoryGirl.create(:property)
        expect(page).to have_content(property.street)
        click_on(property.street)
        expect(page).to have_content(property.amenities)
        expect(page).to have_content(property.description)
    end
    
end