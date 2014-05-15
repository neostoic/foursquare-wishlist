class Wishlist < ActiveRecord::Base
  belongs_to :user
  has_many :venues, dependent: :destroy

  validates_presence_of :user_id
  
end