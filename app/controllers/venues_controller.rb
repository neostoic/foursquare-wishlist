class VenuesController < ApplicationController

  def create
    if current_user.wishlist.nil?
      current_user.build_wishlist
      current_user.save
    end
    @venue = Venue.new(
        :fs_id => params[:fs_id],
        :photo => params[:photo],
        :name => params[:name],
        :wishlist_id => current_user.wishlist.id
    )
    @venue.save
    @wishlist_items = Kaminari.paginate_array(current_user.wishlist.venues).page(params[:page]).per(3)

    respond_to do |format|
      format.js
    end

  end

  def destroy
    @venue = current_user.wishlist.venues.find(params[:id])
    @venue.destroy
    @wishlist_items = Kaminari.paginate_array(current_user.wishlist.venues).page(params[:page]).per(3)
    respond_to do |format|
      format.js
    end
  end
end