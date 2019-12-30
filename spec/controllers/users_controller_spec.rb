require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http ok" do
      get :new

      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    subject { 
      get :create, params: { 
        user: {
          username: 'Test',
          password: '123'
        }
      }
    }

    it 'creates a new user' do
      expect{ subject }.to change(User, :count).by(1)
    end

    it 'has flash notice' do
      subject

      expect(flash[:notice]).to match(/Welcome to message me/)
    end

    it 'redirects to root path' do
      subject

      expect(response).to redirect_to(root_path)
    end
  end

  describe 'GET #edit' do
    let!(:user) { create(:user) }

    before do
      login(user)
    end

    it 'returns http ok' do
      get :edit, params: { id: user.id }

      expect(response).to have_http_status(:ok)
    end
  end

  describe "PUT #update" do
    context 'when valid attributes' do
      let!(:user) { create(:user, username: 'Test') }

      subject { 
        put :update, params: { 
          id: user.id, user: { 
            username: 'New username', 
            password: 'new password'
          }
        }
      }

      before do
        login(user)
      end

      it 'updates the user' do
        subject
        user.reload

        expect(user.username).to eq('New username')
      end

      it 'has flash notice' do
        subject

        expect(flash[:notice]).to match(/Account successfully updated./)
      end

      it 'redirects to root path' do
        subject

        expect(response).to redirect_to(root_path)
      end
    end
  end

  context 'when invalid attributes' do
    let!(:user) { create(:user, username: 'Test') }

    subject { 
      put :update, params: { 
        id: user.id, user: { 
          username: nil, 
          password: nil
        }
      }
    }

    before do
      login(user)
    end

    it 'render edit' do
      subject

      expect(response).to render_template(:edit)
    end
  end
end
