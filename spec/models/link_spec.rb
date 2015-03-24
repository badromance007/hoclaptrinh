require 'rails_helper'

describe Link do

  let(:user) { FactoryGirl.create(:user) }

  it "is valid with a title, url, description, image_url, site_name, user_id" do
    link = FactoryGirl.build(:link, user_id: user.id)
    expect(link).to be_valid
  end

  it "is invalid without title" do
    link = FactoryGirl.build(:link, user_id: user.id, title: nil)
    expect(link).not_to be_valid
  end

  it "is invalid without url" do
    link = FactoryGirl.build(:link, user_id: user.id, url: nil)
    expect(link).not_to be_valid
  end

  it "is invalid without description" do
    link = FactoryGirl.build(:link, user_id: user.id, description: nil)
    expect(link).not_to be_valid
  end

  it "is invalid without image_url" do
    link = FactoryGirl.build(:link, user_id: user.id, image_url: nil)
    expect(link).not_to be_valid
  end

  it "is invalid without site_name" do
    link = FactoryGirl.build(:link, user_id: user.id, site_name: nil)
    expect(link).not_to be_valid
  end

  it "is invalid without user_id" do
    link = FactoryGirl.build(:link, user_id: nil)
    expect(link).not_to be_valid
  end

  it "url is unique" do
    FactoryGirl.create(:link, user_id: user.id, url: 'http://www.google.com')
    link = FactoryGirl.build(:link, user_id: user.id, url: 'http://www.google.com')
    expect(link).not_to be_valid
  end

  it "title isn't unique" do
    FactoryGirl.create(:link, user_id: user.id, title: 'Sample title')
    link = FactoryGirl.build(:link, user_id: user.id, title: 'Sample title')
    expect(link).to be_valid
  end

  it "is begin witn no record" do
    expect(Link.count).to eq 0
  end

  it "have two after adding two" do
    2.times { FactoryGirl.create(:link, user_id: user.id) }
    expect(Link.count).to eq 2
  end

  describe 'New Link' do
    let(:link) { FactoryGirl.create(:link, user_id: user.id) }

    it "is begin with no comment" do
      expect(link.comments.count).to eq 0
    end

    it "have two comments after adding two" do
      2.times { FactoryGirl.create(:comment, user_id: user.id, link_id: link.id) }
      expect(link.comments.count).to eq 2
    end

    it "after destroy link, no comments belong with this link exist" do
      2.times { FactoryGirl.create(:comment, user_id: user.id, link_id: link.id) }
      link.destroy
      expect(Comment.where(link_id: link.id).count).to eq 0
    end

  end
end

