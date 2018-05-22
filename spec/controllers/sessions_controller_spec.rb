require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "GET #new" do
    it "returns http successful" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
