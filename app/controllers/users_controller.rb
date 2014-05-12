class UsersController < ApplicationController

  include FoursquareRequests
  include HTTParty

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
    #@checkins = recent_checkins(current_user.oauth_token)
    checkins = Checkins.get_recent(current_user.oauth_token)
    @list_items = get_users_and_venues(checkins)
  end

  private
  def get_users_and_venues(checkins)
    pictures = checkins.map do |ch|
      venue_photo = FSVenues.get_photo(ch.venue_id, current_user.oauth_token)
      ListItem.new(
          ch.user_photo, ch.user_name,
          ch.venue_id, ch.venue_name, venue_photo
      )
    end
  end

end