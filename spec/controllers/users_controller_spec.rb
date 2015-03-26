require 'rails_helper'

describe UsersController do

  it "redirects to the home page upon save" do
    post :create, user: attributes_for(:user)
    expect(response).to redirect_to root_url
  end

end
