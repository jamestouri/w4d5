require 'rails_helper'
require 'spec_helper'

RSpec.feature "Auths", type: :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"
  
  feature 'the signup process' do
    scenario 'has a new user page' do
      visit new_user_url
      expect(page).to have_content "New"
    end
  end 
  
    feature 'signing up a user' do
      before(:each) do
        visit new_user_url
        fill_in 'user[username]', :with => "testing"
        fill_in 'user[password]', :with => 'atleast6'
        click_on "Create"
    end 
      
    scenario 'shows username on the homepage after signup' do
        expect(page).to have_content "#{User.last.username}"
    end
  end


  feature 'logging in' do
    given!(:hello_world) { FactoryBot.create(:user_hw)}  
  
    scenario 'shows username on the homepage after login' do
      login_as(hello_world)
      expect(page).to have_content "Welcome hello_world" 
    end
  end

  feature 'logging out' do
    scenario 'begins with a logged out state'

    scenario 'doesn\'t show username on the homepage after logout'

  end
end
