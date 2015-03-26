require 'rails_helper'

describe LinksController do

  before :each do
    sign_in create(:user)
  end

  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe "GET #show" do
    it "assigns the requested link to @link" do
      link = create(:link)
      get :show, id: link
      expect(assigns(:link)).to eq link
    end

    it "renders the :show template" do
      link = create(:link)
      get :show, id: link
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Link to @link" do
      get :new
      expect(assigns(:link)).to be_a_new(Link)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested link to @link" do
      link = create(:link)
      get :edit, id: link
      expect(assigns(:link)).to eq link
    end

    it "renders the :edit template" do
      link = create(:link)
      get :edit, id: link
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do

    context "with valid attributes" do
      it "saves the new link in the database" do
        expect{
          post :create, link: attributes_for(:link)
        }.to change(Link, :count).by(1)
      end

      it "redirects to links#show" do
        post :create, link: attributes_for(:link)
        expect(response).to redirect_to link_path(assigns[:link])
      end
    end

    context "with invalid attributes" do
      it "does not save the new link in the database" do
        expect{
          post :create, link: attributes_for(:invalid_link)
        }.to_not change(Link, :count)
      end

      it "re-renders the :new template" do
        post :create, link: attributes_for(:invalid_link)
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do

    before :each do
      @link = create(:link, title: 'Valid link')
    end

    context "with valid attributes" do
      it "located the requested @link" do
        patch :update, id: @link, link: attributes_for(:link)
        expect(assigns(:link)).to eq(@link)
      end

      it "changes @link's attributes" do
        patch :update, id: @link, link: attributes_for(:link, title: 'Updated title')
        @link.reload
        expect(@link.title).to eq ('Updated title')
      end

      it "redirects to the updated link" do
        patch :update, id: @link, link: attributes_for(:link)
        expect(response).to redirect_to @link
      end
    end

    context "with invalid attributes" do
      it "does not update the link's attributes" do
        patch :update, id: @link, link: attributes_for(:link, title: 'Hello', url: nil)
        @link.reload
        expect(@link.title).not_to eq('Hello')
        expect(@link.title).to eq('Valid link')
      end

      it "re-renders the #edit template" do
        patch :update, id: @link, link: attributes_for(:invalid_link)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do

    before :each do
      @link = create(:link)
    end

    it "deletes the link" do
      expect{
        delete :destroy, id: @link
      }.to change(Link, :count).by(-1)
    end

    it "redirects to links#index" do
      delete :destroy, id: @link
      expect(response).to redirect_to links_url
    end
  end

  describe "Guest user" do
    before :each do
      sign_out create(:user)
    end

    describe "GET #new" do
      it "requires login" do
        get :new
        expect(response).to redirect_to new_user_session_url
      end
    end

    describe "GET #edit" do
      it "requires login" do
        link = create(:link)
        get :edit, id: link
        expect(response).to redirect_to new_user_session_url
      end
    end

    describe "POST #create" do
      it "requires login" do
        post :create, id: create(:link), link: attributes_for(:link)
        expect(response).to redirect_to new_user_session_url
      end
    end

    describe "PATCH #update" do
      it "requires login" do
        patch :update, id: create(:link), link: attributes_for(:link)
        expect(response).to redirect_to new_user_session_url
      end
    end

    describe "DELETE #destroy" do
      it "requires login" do
        delete :destroy, id: create(:link)
        expect(response).to redirect_to new_user_session_url
      end
    end
  end
end
