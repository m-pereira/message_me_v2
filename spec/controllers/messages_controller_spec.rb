require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe 'POST #create' do
    let!(:user) { create(:user) }

    subject { 
      post :create, params: {
        message: {
          body: 'Hi this is a simple test.',
          user_id: user.id
        }
      }
    }

    context 'when logged in' do
      before do
        login(user)
      end

      it 'creates a message' do
        expect{ subject }.to change(Message, :count).by(1) 
      end
    end

    context 'when not logged in' do
      it 'does not create a message' do
        expect{ subject }.not_to change(Message, :count) 
      end

      it 'has the message' do
        subject

        expect(flash[:alert]).to eq('You must be logged in to perform that.')
      end
    end
  end
end
