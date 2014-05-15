class User < ActiveRecord::Base

  has_one :wishlist, dependent: :destroy

  def self.create_from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.photo = auth.info.image.prefix + '30x30' + auth.info.image.suffix
      user.oauth_token = auth.credentials.token
      user.build_wishlist
      user.save!
    end
  rescue => e
    Rails.logger.error { "#{e.message} #{e.backtrace.join("\n")}" }
    nil
  end
end
