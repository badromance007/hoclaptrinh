require 'rails_helper'

RSpec.describe Comment, :type => :model do

  describe "New comment" do
    let(:user) { FactoryGirl.create(:user) }
    let(:link) { FactoryGirl.create(:link, user_id: user.id) }
    let(:comment) { FactoryGirl.create(:comment, user_id: user.id, link_id: link.id) }

    it "must have user_id" do
      expect(comment.user_id).to be_present
      expect(comment.user_id).to be_a Integer
    end

    it "must have link_id" do
      expect(comment.link_id).to be_present
      expect(comment.link_id).to be_a Integer
    end

    it "must have body" do
      expect(comment.body).to be_present
      expect(comment.body).to be_a String
    end
  end

  describe "The comment" do
    let(:user) { FactoryGirl.create(:user) }
    let(:link) { FactoryGirl.create(:link, user_id: user.id) }

    it "must has two after adding two" do
      2.times { FactoryGirl.create(:comment, user_id: user.id, link_id: link.id) }
      expect(Comment.count).to eq 2
    end

    it "after destroyed user, no comment belong to that user exists" do
      2.times { FactoryGirl.create(:comment, user_id: user.id, link_id: link.id) }
      user.destroy
      expect(Comment.where(user_id: user.id).count).to eq 0
    end

    it "after destroyed link, no comment belong to that link exists" do
      2.times { FactoryGirl.create(:comment, user_id: user.id, link_id: link.id) }
      link.destroy
      expect(Comment.where(link_id: link.id).count).to eq 0
    end
  end

  it "must begin with no record" do
    expect(Comment.count).to eq 0
  end

end
