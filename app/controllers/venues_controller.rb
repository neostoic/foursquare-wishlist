class VenuesController < ApplicationController

  def create
    @venue = Venue.new(
        :fs_id => params[:fs_id],
        :photo => params[:photo],
        :name => params[:name],
        :wishlist_id => current_user.wishlist.id
    )
    @venue.save
    @wishlist_items = get_paginated_list(current_user.wishlist.venues, 4)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @venue = current_user.wishlist.venues.find(params[:id])
    @venue.destroy
    @wishlist_items = get_paginated_list(current_user.wishlist.venues, 4)
    respond_to do |format|
      format.js
    end
  end

end