class CreateSharedposts < ActiveRecord::Migration[5.2]
  def change
    create_table :sharedposts do |t|
      t.references :user, foreign_key: true
      t.references :posts, foreign_key: true
      t.datetime :date_of_sharing

      t.timestamps
    end
  end
end
