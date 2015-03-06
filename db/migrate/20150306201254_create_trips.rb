class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :image_name
      t.string :tag_line
      t.integer :price_cents
      t.string :location
      t.string :tag
      t.integer :capacity

      t.timestamps null: false
    end
  end
end
