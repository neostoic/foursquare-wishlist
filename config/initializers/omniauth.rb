OmniAuth.config.logger = Rails.logger

ENV['FOURSQUARE_ID'] ||= 'NNKJLKWK1YWUFIJFRDOA3YHQFV3HJ1FFK3JRVARFXXXOKEIT'
ENV['FOURSQUARE_KEY'] ||= '44KQ3I14KL5PJICSP4T0XEJPEV0BASFMSM02PCESPIOE2AHA'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :foursquare, ENV['FOURSQUARE_ID'], ENV['FOURSQUARE_KEY']
end