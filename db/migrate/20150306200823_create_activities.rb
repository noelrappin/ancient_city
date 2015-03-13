class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :trip, index: true
      t.string :name
      t.text :description
      t.integer :price_cents, default: 0

      t.timestamps null: false
    end
    add_foreign_key :activities, :trips
  end
end
