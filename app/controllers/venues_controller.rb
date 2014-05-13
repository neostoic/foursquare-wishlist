class VenuesController < ApplicationController

  def create
    if current_user.wishlist.nil?
      current_user.build_wishlist
      current_user.save
    end
    @venue = Venue.new
    @venue.fs_id = params[:fs_id]
    @venue.photo = params[:photo]
    @venue.name = params[:name]
    @venue.wishlist = current_user.wishlist
    @venue.save
    @wishlist_items = current_user.wishlist.venues
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @venue = current_user.wishlist.venues.find(params[:id])
    @venue.destroy
    @wishlist_items = current_user.wishlist.venues
    respond_to do |format|
      format.js
    end
  end
end