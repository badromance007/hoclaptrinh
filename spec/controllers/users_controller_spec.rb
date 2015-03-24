require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  it "redirects to the home page upon save" do
    subject { post :create, user: FactoryGirl.create(:user) }
    expect(subject).to redirect_to root_url
  end

end
