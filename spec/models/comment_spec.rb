require 'rails_helper'

describe Comment do

  it "is valid with body, user_id, link_id" do
    comment = build(:comment)
    expect(comment).to be_valid
  end

  it "is invalid without body" do
    comment = build(:comment, body: nil)
    expect(comment).not_to be_valid
  end

  it "is invalid without user_id" do
    comment = build(:comment, user_id: nil)
    expect(comment).not_to be_valid
  end

  it "is invalid without link_id" do
    comment = build(:comment, link_id: nil)
    expect(comment).not_to be_valid
  end

  it "is begin with no record" do
    expect(Comment.count).to eq 0
  end

  it "have two after adding two" do
    2.times { create(:comment) }
    expect(Comment.count).to eq 2
  end

  it "body length great than 3 character" do
    comment = build(:comment, body: 'foo')
    expect(comment).not_to be_valid
  end
end
