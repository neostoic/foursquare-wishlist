require 'spec_helper'

describe User do
  before do
    @user = FactoryGirl.create(:user)
  end
  it "should have a wishlist" do
    @user.wishlist != nil
  end
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it "should have one wishlist" do
    t = User.reflect_on_association(:wishlist)
    expect(t.macro).to equal :has_one
  end
end