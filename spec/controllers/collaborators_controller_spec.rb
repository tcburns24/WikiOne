require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do

  before(:each) do
    @my_user = FactoryGirl.create(:user, email: "myuser@gmail.com")
    sign_in @my_user
    @collab_user = FactoryGirl.create(:user, email: "work_together@gmail.com")
    @my_wiki = FactoryGirl.create(:wiki, user: @my_user)
    @my_collaborator = FactoryGirl.create(:collaborator, user: @collab_user)
  end

  describe "POST create" do
    it "increases the number of collaborators by 1" do
      expect { post :create, collaborator: { user_id: @my_user.id, wiki_id: @my_wiki.id }}.to change(Collaborator,:count).by(1)
    end
  end

  describe "DELETE destroy" do
    it "deletes the collaborator" do
      delete :destroy, id: @my_collaborator.id
      count = Collaborator.where({user_id: @collab_user.id}).count
      expect(count).to eq 0
    end

    it "redirects to the wiki" do
      delete :destroy, id: @my_collaborator.id
      expect(response).to redirect_to(wiki_url(@my_collaborator.wiki))
    end
  end
end
