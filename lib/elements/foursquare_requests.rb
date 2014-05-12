module FoursquareRequests
  include HTTParty

  #base_uri "https://api.foursquare.com/v2"
  FS_VERSION = 20140510

  module Checkins

    include HTTParty

    class FSCheckin

      attr_accessor :user_name, :user_photo, :venue_id, :venue_name

      def initialize(user_name, user_photo, venue_id, venue_name)
        @user_name = user_name
        @user_photo = user_photo
        @venue_id = venue_id
        @venue_name = venue_name
      end
    end
    def self.get_recent(token)
      response = get("https://api.foursquare.com/v2/checkins/recent?oauth_token=#{token}&v=#{FS_VERSION}")
      if response.success?
        checkins = response['response']['recent'].map do |ch|
          user_name = ch['user']['firstName'] + ' ' + ch['user']['lastName']
          user_photo = ch['user']['photo']['prefix'] + '30x30' + ch['user']['photo']['suffix']
          venue_id = ch['venue']['id']
          venue_name = ch['venue']['name']
          FSCheckin.new(user_name, user_photo, venue_id, venue_name)
        end
      else
        raise response.response
      end
    end
  end

  #module FSUsers
  #
  #  include HTTParty
  #
  #  def self.get_fs_data(user_id,token)
  #    response = get("https://api.foursquare.com/v2/users/#{user_id}?oauth_token=#{token}&v=#{FS_VERSION}")
  #    if response.success?
  #      prefix = response['response']['user']['photo']['prefix']
  #      suffix = response['response']['user']['photo']['suffix']
  #      photo_uri = prefix + '30x30' + suffix
  #    else
  #      raise response.response
  #    end
  #  end
  #end

  module FSVenues

    include HTTParty

    def self.get_photo(venue_id,token)
      response = get("https://api.foursquare.com/v2/venues/#{venue_id}?oauth_token=#{token}&v=#{FS_VERSION}")
      if response.success?
        prefix = response['response']['venue']['photos']['groups'].first['items'].first['prefix']
        suffix = response['response']['venue']['photos']['groups'].first['items'].first['suffix']
        photo_uri = prefix + '110x110' + suffix
      else
        raise response.response
      end
    end
  end

  #
  #def get_user_friends(user_id)
  #  response = get("https://api.foursquare.com/v2/users/#{user_id}")
  #  if response.success?
  #    friends = response.friends.groups.items.map { |friend| [friend.id, friend.photo] }
  #  else
  #    raise response.response
  #  end
  #end

end