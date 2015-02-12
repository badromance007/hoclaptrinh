require 'rails_helper'

RSpec.describe User, :type => :model do

  it "returns only confirmed users" do
    confirmed_user = create(:user, confirmed?: true)
    result = User.where(confirmed?: true)
    expect(result).to eq confirmed_user
  end

  it "should be incremented after create link" do
    user = create_user
    number_of_links = user.links.count
    link.create(user_id: user.id)
    expect(user.links.count).to eq number_of_links + 1
  end
end
