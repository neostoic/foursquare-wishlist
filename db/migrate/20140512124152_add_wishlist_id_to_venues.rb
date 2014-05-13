class AddWishlistIdToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :wishlist_id, :integer
  end
end