class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
