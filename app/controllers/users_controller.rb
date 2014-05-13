class UsersController < ApplicationController

  include FoursquareRequests

  class ListItem
    attr_accessor :user_photo, :user_name, :venue_id, :venue_name, :venue_photo

    def initialize(user_photo, user_name, venue_id, venue_name, venue_photo)
      @user_photo = user_photo
      @user_name = user_name
      @venue_id = venue_id
      @venue_name = venue_name
      @venue_photo = venue_photo
    end
  end

  def home
    @wishlist_items = get_paginated_wishlist(current_user.wishlist.venues, 3)
    checkins = Checkins.get_recent(current_user.oauth_token)
    list = get_list_items_from_checkins(remove_wishlist_items(checkins))
    @list_items = Kaminari.paginate_array(list).page(params[:page]).per(3)
  end

  private
  def get_list_items_from_checkins(checkins)
    pictures = checkins.map do |ch|
      venue_photo = FSVenues.get_photo(ch.venue_id, current_user.oauth_token)
      ListItem.new(
          ch.user_photo, ch.user_name,
          ch.venue_id, ch.venue_name, venue_photo
      )
    end
  end

  def remove_wishlist_items(checkins)
    checkins = checkins.delete_if { |ch|
      in_wishlist = @wishlist_items.any? { |item| item.fs_id == ch.venue_id }
    }
  end

end