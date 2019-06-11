class AddLocationToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :latitude, :decimal
    add_column :posts, :longitude, :decimal
  end
end
