require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe "GET #show" do
    it "returns http success" do
      sign_in user
      get :show

      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      sign_in user
      get :show

      expect(response).to render_template(:show)
    end
  end
end
