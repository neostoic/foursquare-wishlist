class VenuesController < ApplicationController

  def create
    wishlist = current_user.wishlist || current_user.build_wishlist
    venue = Venue.new
    venue.fs_id = params[:fs_id]
    venue.photo = params[:photo]
    venue.name = params[:name]
    venue.save
  end
end
