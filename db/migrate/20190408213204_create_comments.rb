class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.datetime :public_date
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
