require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @my_user = FactoryGirl.create(:user)
    sign_in @my_user
  end

  describe "GET #show" do
    it "returns http success" do
      sign_in @my_user
      get :show
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      sign_in @my_user
      get :show
      expect(response).to render_template(:show)
    end
  end
end
