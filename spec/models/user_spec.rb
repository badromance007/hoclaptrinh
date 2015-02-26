require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "New user" do
    let(:user) { FactoryGirl.create(:user) }

    it "must have email" do
      expect(user).to respond_to :email
    end

    it "must have password" do
      expect(user).to respond_to :password
    end

    it "must begin with no link" do
      expect(user.links.count).to eq 0
    end

    it "must has two links after adding two links" do
      2.times { FactoryGirl.create(:link, user_id: user.id) }
      expect(user.links.count).to eq 2
    end

    it "must begin with no comment" do
      expect(user.comments.count).to eq 0
    end

    it "must has two comments after adding two comments" do
      link = FactoryGirl.create(:link, user_id: user.id)
      2.times { FactoryGirl.create(:comment, user_id: user.id, link_id: link.id) }
      expect(user.comments.count).to eq 2
    end
  end

  it "must begin with no record" do
    expect(User.count).to eq 0
  end

  it "must has two after adding two" do
    2.times { FactoryGirl.create(:user) }
    expect(User.count).to eq 2
  end

end
