require 'spec_helper'

describe Venue do

  let(:wishlist) { FactoryGirl.create(:wishlist) }

  before do
    @venue = FactoryGirl.create(:venue, wishlist: wishlist)
  end
  it "should have a wishlist_id" do
    @venue.wishlist_id != nil
  end
  it "has a valid factory" do
    expect(FactoryGirl.create(:venue)).to be_valid
  end
  it "should belong to wishlist" do
    t = Venue.reflect_on_association(:wishlist)
    expect(t.macro).to equal :belongs_to
  end
end