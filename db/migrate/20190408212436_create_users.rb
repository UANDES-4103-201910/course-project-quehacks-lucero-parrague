class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :admin_level #this function is only avalible by console, also an admin must be created in console
      t.string :name
      t.string :last_name
      t.string :password
      t.string :biography
      t.string :gps
      t.string :city
      t.string :country
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
