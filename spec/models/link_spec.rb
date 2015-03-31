require 'rails_helper'

describe Link do

  it "is valid with a title, url, description, image_url, site_name, user_id" do
    link = build(:link)
    expect(link).to be_valid
  end

  it "is invalid without title" do
    link = build(:link, title: nil)
    expect(link).not_to be_valid
  end

  it "is invalid without url" do
    link = build(:link, url: nil)
    expect(link).not_to be_valid
  end

  it "is invalid without description" do
    link = build(:link, description: nil)
    expect(link).not_to be_valid
  end

  it "is invalid without site_name" do
    link = build(:link, site_name: nil)
    expect(link).not_to be_valid
  end

  it "is invalid without user_id" do
    link = build(:link, user_id: nil)
    expect(link).not_to be_valid
  end

  it "url is unique" do
    create(:link, url: 'http://www.google.com')
    link = build(:link, url: 'http://www.google.com')
    expect(link).not_to be_valid
  end

  it "is begin witn no record" do
    expect(Link.count).to eq 0
  end

  it "have two after adding two" do
    2.times { create(:link) }
    expect(Link.count).to eq 2
  end

  describe 'New Link' do
    let(:link) { create(:link) }

    it "is begin with no comment" do
      expect(link.comments.count).to eq 0
    end

    it "have two comments after adding two" do
      2.times { create(:comment, link_id: link.id) }
      expect(link.comments.count).to eq 2
    end

    it "after destroy link, no comments belong with this link exist" do
      2.times { create(:comment, link_id: link.id) }
      link.destroy
      expect(Comment.where(link_id: link.id).count).to eq 0
    end

  end
end

