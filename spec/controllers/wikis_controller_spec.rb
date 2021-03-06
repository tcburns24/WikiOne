require 'rails_helper'

RSpec.describe WikisController, type: :controller do

  before(:each) do
    @my_user = FactoryGirl.create(:user)
    sign_in @my_user
    @stranger_user = FactoryGirl.create(:user, email: "stranger_things@gmail.com")
    @my_wiki = FactoryGirl.create(:wiki, user: @stranger_user)
  end

#=======================================#

  context "standard" do

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    #---------------------------------------#

    describe "GET show" do
      it "returns http success" do
        get :show, {id: @my_wiki.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the show view" do
        get :show, {id: @my_wiki.id}
        expect(response).to render_template :show
      end

      it "assigns @my_wiki to @wiki" do
        get :show, {id: @my_wiki.id}
        expect(assigns(:wiki)).to eq(@my_wiki)
      end
    end

    #---------------------------------------#

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the new view" do
        get :new
        expect(response).to render_template :new
      end

      it "instantiates @wiki" do
        get :new
        expect(assigns(:wiki)).not_to be_nil
      end
    end
  #------------------------------------------#

    describe "POST create" do
      it "increases the number of Wikis by 1" do
        expect{post :create, wiki: {title: "Sample Title", body: "sample body text", private: false}}.to change(Wiki,:count).by(1)
      end

      it "assigns the new wiki to @wiki" do
        post :create, wiki: {title: "Sample Title", body: "Sample body text.", private: false}
        expect(assigns(:wiki)).to eq Wiki.last
      end

      it "redirects to the new wiki" do
        post :create, wiki: {title: "Sample Title", body: "sample body text.", private: false}
        expect(response).to redirect_to Wiki.last
      end
    end

  #------------------------------------------#

    describe "GET edit" do
      it "returns http success" do
        get :edit, {id: @my_wiki.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the edit view" do
        get :edit, {id: @my_wiki.id}
        expect(response).to render_template :edit
      end

      it "assigns wiki to be updated to @wiki" do
        get :edit, {id: @my_wiki.id}
        wiki_instance = assigns(:wiki)
        expect(wiki_instance.id).to eq @my_wiki.id
        expect(wiki_instance.title).to eq @my_wiki.title
        expect(wiki_instance.body).to eq @my_wiki.body
      end
    end

  #-----------------------------------------#

    describe "PUT update" do
      it "updates post with expected attributes" do
        new_title = "Sample New Title"
        new_body =  "Sample New Body Text"

        put :update, id: @my_wiki.id, wiki: {title: new_title, body: new_body}
        updated_wiki = assigns(:wiki)
        expect(updated_wiki.id).to eq @my_wiki.id
        expect(updated_wiki.title).to eq new_title
        expect(updated_wiki.body).to eq new_body
      end

      it "redirects to the updated post" do
        new_title = "Sample New Title"
        new_body = "Sample New Body Text"
        put :update, id: @my_wiki.id, wiki: {title: new_title, body: new_body}
        expect(response).to redirect_to @my_wiki
      end
    end

  #---------------------------------------#

    describe "DELETE destroy" do
      it "redirects to wiki index" do
        expect {
            bypass_rescue
            delete :destroy, {id: @my_wiki.id}
          }.to raise_error Pundit::NotAuthorizedError
      end
    end
  end

  #=======================================#

  context "admin" do



    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    #---------------------------------------#

    describe "GET show" do
      it "returns http success" do
        get :show, {id: @my_wiki.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the show view" do
        get :show, {id: @my_wiki.id}
        expect(response).to render_template :show
      end

      it "assigns @my_wiki to @wiki" do
        get :show, {id: @my_wiki.id}
        expect(assigns(:wiki)).to eq(@my_wiki)
      end
    end

    #---------------------------------------#

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the new view" do
        get :new
        expect(response).to render_template :new
      end

      it "instantiates @wiki" do
        get :new
        expect(assigns(:wiki)).not_to be_nil
      end
    end
  #------------------------------------------#

    describe "POST create" do
      it "increases the number of Wikis by 1" do
        expect{post :create, wiki: {title: "Sample Title", body: "sample body text", private: false}}.to change(Wiki,:count).by(1)
      end

      it "assigns the new wiki to @wiki" do
        post :create, wiki: {title: "Sample Title", body: "Sample body text.", private: false}
        expect(assigns(:wiki)).to eq Wiki.last
      end

      it "redirects to the new wiki" do
        post :create, wiki: {title: "Sample Title", body: "sample body text.", private: false}
        expect(response).to redirect_to Wiki.last
      end
    end

  #------------------------------------------#

    describe "GET edit" do
      it "returns http success" do
        get :edit, {id: @my_wiki.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the edit view" do
        get :edit, {id: @my_wiki.id}
        expect(response).to render_template :edit
      end

      it "assigns wiki to be updated to @wiki" do
        get :edit, {id: @my_wiki.id}
        wiki_instance = assigns(:wiki)
        expect(wiki_instance.id).to eq @my_wiki.id
        expect(wiki_instance.title).to eq @my_wiki.title
        expect(wiki_instance.body).to eq @my_wiki.body
      end
    end

  #-----------------------------------------#

    describe "PUT update" do
      it "updates post with expected attributes" do
        new_title = "Sample New Title"
        new_body =  "Sample New Body Text"

        put :update, id: @my_wiki.id, wiki: {title: new_title, body: new_body}
        updated_wiki = assigns(:wiki)
        expect(updated_wiki.id).to eq @my_wiki.id
        expect(updated_wiki.title).to eq new_title
        expect(updated_wiki.body).to eq new_body
      end

      it "redirects to the updated post" do
        new_title = "Sample New Title"
        new_body = "Sample New Body Text"
        put :update, id: @my_wiki.id, wiki: {title: new_title, body: new_body}
        expect(response).to redirect_to @my_wiki
      end
    end

  #---------------------------------------#

    describe "DELETE destroy" do

      it "deletes the wiki" do
        @my_user.add_role :admin
        delete :destroy, {id: @my_wiki.id}
        count = Wiki.where({id: @my_wiki.id}).size
        expect(count).to eq 0
        expect(response).to redirect_to wikis_path
        @my_user.remove_role :admin
      end
    end
  end

  #=======================================#

  context "premium" do

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    #---------------------------------------#

    describe "GET show" do
      it "returns http success" do
        get :show, {id: @my_wiki.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the show view" do
        get :show, {id: @my_wiki.id}
        expect(response).to render_template :show
      end

      it "assigns @my_wiki to @wiki" do
        get :show, {id: @my_wiki.id}
        expect(assigns(:wiki)).to eq(@my_wiki)
      end
    end

    #---------------------------------------#

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the new view" do
        get :new
        expect(response).to render_template :new
      end

      it "instantiates @wiki" do
        get :new
        expect(assigns(:wiki)).not_to be_nil
      end
    end
  #------------------------------------------#

    describe "POST create" do
      it "increases the number of Wikis by 1" do
        expect{post :create, wiki: {title: "Sample Title", body: "sample body text", private: false}}.to change(Wiki,:count).by(1)
      end

      it "assigns the new wiki to @wiki" do
        post :create, wiki: {title: "Sample Title", body: "Sample body text.", private: false}
        expect(assigns(:wiki)).to eq Wiki.last
      end

      it "redirects to the new wiki" do
        post :create, wiki: {title: "Sample Title", body: "sample body text.", private: false}
        expect(response).to redirect_to Wiki.last
      end
    end

  #------------------------------------------#

    describe "GET edit" do
      it "returns http success" do
        get :edit, {id: @my_wiki.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the edit view" do
        get :edit, {id: @my_wiki.id}
        expect(response).to render_template :edit
      end

      it "assigns wiki to be updated to @wiki" do
        get :edit, {id: @my_wiki.id}
        wiki_instance = assigns(:wiki)
        expect(wiki_instance.id).to eq @my_wiki.id
        expect(wiki_instance.title).to eq @my_wiki.title
        expect(wiki_instance.body).to eq @my_wiki.body
      end
    end

  #-----------------------------------------#

    describe "PUT update" do
      it "updates post with expected attributes" do
        new_title = "Sample New Title"
        new_body =  "Sample New Body Text"

        put :update, id: @my_wiki.id, wiki: {title: new_title, body: new_body}
        updated_wiki = assigns(:wiki)
        expect(updated_wiki.id).to eq @my_wiki.id
        expect(updated_wiki.title).to eq new_title
        expect(updated_wiki.body).to eq new_body
      end

      it "redirects to the updated post" do
        new_title = "Sample New Title"
        new_body = "Sample New Body Text"
        put :update, id: @my_wiki.id, wiki: {title: new_title, body: new_body}
        expect(response).to redirect_to @my_wiki
      end
    end

  #---------------------------------------#

    describe "DELETE destroy" do
      it "deletes the wiki" do
        @my_user.add_role :premium
        expect {
            bypass_rescue
            delete :destroy, {id: @my_wiki.id}
          }.to raise_error Pundit::NotAuthorizedError
        @my_user.remove_role :premium
      end
    end
  end
end
