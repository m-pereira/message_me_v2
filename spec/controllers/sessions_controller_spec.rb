require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'returns http ok' do
      get :new

      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    let!(:user) { create(:user) }

    subject { 
      post :create, params: {
        session: {
          username: user.username,
          password: user.password
        }
      }
    }

    it 'has session[:user_id]' do
      subject

      expect(session[:user_id]).to eq(user.id)
    end

    it "returns the flash message" do
      subject

      expect(flash[:notice]).to match(/You have successfully logged in./)
    end

    it 'redirects to root_path' do
      subject

      expect(response).to redirect_to(root_path)
    end
  end

  describe "DELETE #destroy" do
    let!(:user) { create(:user) }
    let!(:login) { 
      post :create, params: {
        session: {
          username: user.username,
          password: user.password
        }
      }
    }

    subject { delete :destroy, params: { id: user.id } }

    it 'has session[:user_id] = nil' do
      subject

      expect(session[:user_id]).to eq(nil)
    end

    it "has flash message" do
      subject

      expect(flash[:notice]).to match(/You have logged out./)
    end

    it 'redirects to login page' do
      subject

      expect(response).to redirect_to(login_path)
    end
  end
end
