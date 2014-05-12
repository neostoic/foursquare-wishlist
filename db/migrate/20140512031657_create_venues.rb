class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :fs_id
      t.string :photo
      t.string :name

      t.timestamps
    end
  end
end
