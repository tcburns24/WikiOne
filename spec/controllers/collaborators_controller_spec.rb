require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do

  describe "POST create" do
    it "increases the number of collaborators by 1" do
      expect { post :create, collaborator: { user_id: 123, wiki_id: 456 }}.to change(Collaborator,:count).by(1)
    end
  end

  describe "DELETE destroy" do
    it "deletes the collaborator" do
      delete :destroy, user_id: 123, wiki_id: 456
      count = Collaborator.where({user_id: 123}).count
      expect(count).to eq 0
    end

    it "returns HTTP success" do
      delete :destroy, user_id: 123, wiki_id: 456
      expect(response).to have_http_status(:success)
    end
  end
end
