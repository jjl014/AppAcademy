require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders the new users page' do
      get :new

      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'redirects to the users index page' do
        post :create, params: {user: {username: "hello@world.com", password: "good_password"}}
        expect(response).to redirect_to(users_url)

      end
    end

    context 'with invalid params' do
      it 'validates the presence of the username and password' do
        post :create, params: {user: {username: "hello@world.com", password: ""}}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end

      it 'validates the length of the password is at least 6' do
        post :create, params: {user: {username: "hello@world.com", password:"short"}}
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
  end
end
