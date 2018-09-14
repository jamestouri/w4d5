require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
    subject(:user) {User.create!(username: 'james@email.com', password: 'password1234')} 
  
    it "find by credentials" do
      User.create!(username: 'me@email.com', password: '1234567')
      user_j = User.find_by_credentials('me@email.com', '1234567')
      expect(user_j.username).to eq('me@email.com') 
    end 
    
    it "password= returns password_digest" do 
      user = User.create!(username: 'me@email.com', password: '1234567')
      expect(user.password_digest).to_not be_nil
    end 
    
    
    it {should validate_presence_of (:username)}
    it {should validate_presence_of (:password_digest)}
    it {should validate_uniqueness_of (:username)}
    it {should validate_length_of(:password).is_at_least(6).on(:create)}
    
end
