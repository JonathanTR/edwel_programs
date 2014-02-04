require 'spec_helper'

feature 'Locations' do
  
  context 'Creating a new location' do
    scenario 'should create a page for that location' do
      test_location = Location.create(name: 'Tampa')
      visit root_path
      page.should have_content(test_location.name)
    end
  end

end