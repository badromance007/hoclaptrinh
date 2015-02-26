require 'rails_helper'

RSpec.describe Link, :type => :model do

  describe "New link" do
    let(:user) { FactoryGirl.create(:user) }
    let(:link) { FactoryGirl.create(:link, user_id: user.id) }

    it "must have user_id" do
      expect(link).to respond_to :user_id
    end

    it "must have title" do
      expect(link).to respond_to :title
    end

    it "must have url" do
      expect(link).to respond_to :url
    end

    it "must have description" do
      expect(link).to respond_to :description
    end

    it "must have image_url" do
      expect(link).to respond_to :image_url
    end

    it "must have site_name" do
      expect(link).to respond_to :site_name
    end

    it "must begin with no comment" do
      expect(link.comments.count).to eq 0
    end

    it "must has two comments after adding two comments" do
      2.times { FactoryGirl.create(:comment, user_id: user.id, link_id: link.id) }
      expect(link.comments.count).to eq 2
    end
  end

  it "must begin with no record" do
    expect(Link.count).to eq 0
  end

  it "must has two after adding two" do
    user = FactoryGirl.create(:user)
    2.times { FactoryGirl.create(:link, user_id: user.id) }
    expect(Link.count).to eq 2
  end

  it "after destroyed user, no link belong to that user exists" do
    user = FactoryGirl.create(:user)
    2.times { FactoryGirl.create(:link, user_id: user.id) }
    user.destroy
    expect(Link.where(user_id: user.id).count).to eq 0
  end

end
