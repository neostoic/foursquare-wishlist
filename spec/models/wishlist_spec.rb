require 'spec_helper'

describe Wishlist do

  let(:user) { FactoryGirl.create(:user) }

  before do
    @wishlist = FactoryGirl.create(:wishlist, user: user )
  end
  it "should have a user" do
    @wishlist.user_id != nil
  end
  it "has a valid factory" do
    expect(FactoryGirl.create(:wishlist)).to be_valid
  end
  it "should belong to user" do
    t = Wishlist.reflect_on_association(:user)
    expect(t.macro).to equal :belongs_to
  end
  it "should have many venues" do
    t = Wishlist.reflect_on_association(:venues)
    expect(t.macro).to equal :has_many
  end
end