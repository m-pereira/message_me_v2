require 'rails_helper'

RSpec.describe ChatroomController, type: :controller do
  describe "GET #index" do
    context 'when not logged in' do
      it "returns http ok" do
        get :index

        expect(response).to have_http_status(302)
        expect(flash[:alert]).to eq('You must be logged in to perform that.')
      end
    end

    context 'when logged in' do
      let!(:user) { create(:user) }

      it 'resturns http status ok' do
        login(user)
        get :index

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
