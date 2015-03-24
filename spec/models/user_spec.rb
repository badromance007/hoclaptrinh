require 'rails_helper'

describe User do

  it "is valid with a name, email, password" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryGirl.build(:user, name: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without an email" do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without a password" do
    user = FactoryGirl.build(:user, password: nil)
    expect(user).not_to be_valid
  end

  it "is invalid with a duplicate email" do
    FactoryGirl.create(:user, email: 'example@gmail.com')
    user = FactoryGirl.build(:user, email: 'example@gmail.com')
    expect(user).not_to be_valid
  end

  it "is begin with no record" do
    expect(User.count).to eq 0
  end

  it "have two after adding two" do
    2.times { FactoryGirl.create(:user) }
    expect(User.count).to eq 2
  end


  describe 'New User' do
    let(:user) { FactoryGirl.create(:user) }

    it "is begin with no link" do
      expect(user.links.count).to eq 0
    end

    it "have two links after adding two" do
      2.times { FactoryGirl.create(:link, user_id: user.id) }
      expect(user.links.count).to eq 2
    end

    it "is begin with no comment" do
      expect(user.comments.count).to eq 0
    end

    it "have two comments after adding two" do
      link = FactoryGirl.create(:link, user_id: user.id)
      2.times { FactoryGirl.create(:comment, user_id: user.id, link_id: link.id) }
      expect(user.comments.count).to eq 2
    end

    it "after destroy user, no links belongs with this user exist" do
      2.times { FactoryGirl.create(:link, user_id: user.id) }
      user.destroy
      expect(Link.where(user_id: user.id).count).to eq 0
    end

    it "after destroy user, no comments belongs with this user exist" do
      link = FactoryGirl.create(:link, user_id: user.id)
      2.times { FactoryGirl.create(:comment, user_id: user.id, link_id: link.id) }
      user.destroy
      expect(Comment.where(user_id: user.id).count).to eq 0
    end

  end
end
