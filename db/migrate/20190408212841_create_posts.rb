class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.datetime :public_date
      t.string :city
      t.string :country
      t.string :gps
      t.boolean :open_or_closed
      t.boolean :solved
      t.boolean :visible
      t.boolean :dumpster
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
