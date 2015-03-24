require 'rails_helper'

describe Comment do
  let(:user) { FactoryGirl.create(:user) }
  let(:link) { FactoryGirl.create(:link, user_id: user.id) }

  it "is valid with body, user_id, link_id" do
    comment = FactoryGirl.build(:comment, user_id: user.id, link_id: link.id)
    expect(comment).to be_valid
  end

  it "is invalid without body" do
    comment = FactoryGirl.build(:comment, user_id: user.id, link_id: link.id, body: nil)
    expect(comment).not_to be_valid
  end

  it "is invalid without user_id" do
    comment = FactoryGirl.build(:comment, user_id: nil, link_id: link.id)
    expect(comment).not_to be_valid
  end

  it "is invalid without link_id" do
    comment = FactoryGirl.build(:comment, user_id: user.id, link_id: nil)
    expect(comment).not_to be_valid
  end

  it "is begin with no record" do
    expect(Comment.count).to eq 0
  end

  it "have two after adding two" do
    2.times { FactoryGirl.create(:comment, user_id: user.id, link_id: link.id) }
    expect(Comment.count).to eq 2
  end

  it "body length great than 3 character" do
    comment = FactoryGirl.build(:comment, user_id: user.id, link_id: link.id, body: 'foo')
    expect(comment).not_to be_valid
  end
end
