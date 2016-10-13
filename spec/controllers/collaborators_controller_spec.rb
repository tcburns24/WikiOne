require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do

  describe "POST create" do
    it "increases the number of collaborators by 1" do
      expect{post :create, collaborator: {user_id: "Sample ID", wiki_id: "sample wiki id"}}.to change(Collaborator,:count).by(1)
    end
  end

  describe "DELETE destroy" do
    it "redirects to wiki index" do
      expect {
          bypass_rescue
          delete :destroy, {id: @collaborator.id}
        }.to raise_error Pundit::NotAuthorizedError
      
    end
  end
end
