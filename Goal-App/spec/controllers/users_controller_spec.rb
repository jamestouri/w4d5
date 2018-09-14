require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    subject(:user){User.create!(username: 'james', password: "henry12")}
    
    describe "GET#new" do
      it "renders the new users template" do
        get :new
        expect(response).to render_template(:new)
      end
    end
    
    describe "POST#create" do
      it "creates user" do
        post :create, params: { user: { username: 'jammy', password: 'henry123'}}
        expect(response).to redirect_to(user_url(User.last))
      end
    end
    
    describe "GET #show" do
      it "shows user's profile" do
        get :show, params: {id: user.id}
        # user = User.find_by(id: user.id)
        expect(response).to render_template(:show)
    end
    end
end
