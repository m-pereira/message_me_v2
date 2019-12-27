require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "GET #new" do
    it "returns http ok" do
      get :new

      expect(response).to have_http_status(:ok)
    end
  end

  # describe "POST #create" do
  #   it "returns http ok" do
  #     get :create
  #     expect(response).to have_http_status(:ok)
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "returns http ok" do
  #     get :destroy
  #     expect(response).to have_http_status(:ok)
  #   end
  # end
end
