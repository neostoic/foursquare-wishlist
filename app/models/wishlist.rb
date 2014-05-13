class Wishlist < ActiveRecord::Base
  belongs_to :user
  has_many :venues, dependent: :destroy
end