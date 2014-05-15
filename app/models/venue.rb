class Venue < ActiveRecord::Base
  belongs_to :wishlist

  validates_presence_of :wishlist_id

end