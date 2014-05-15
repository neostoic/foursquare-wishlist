module FoursquareRequests

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
      end
    rescue => e
      Rails.logger.error { "#{e.message} #{e.backtrace.join("\n")}" }
      nil
    end
  end

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

end