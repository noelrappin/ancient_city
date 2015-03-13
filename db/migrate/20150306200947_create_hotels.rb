class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.references :trip, index: true
      t.string :name
      t.text :description
      t.integer :price_cents, default: 0
      t.string :remote_api_id

      t.timestamps null: false
    end
    add_foreign_key :hotels, :trips
  end
end
