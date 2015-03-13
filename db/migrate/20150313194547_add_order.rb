class AddOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :total_price_paid_cents, default: 0
      t.references :user
      t.timestamps
    end

    create_table :order_line_items do |t|
      t.references :order
      t.references :buyable, polymorphic: true
      t.integer :amount
      t.integer :unit_price_cents, default: 0
      t.integer :extended_price_cents, default: 0
      t.integer :processing_fee_cents, default: 0
      t.integer :price_paid_cents, default: 0
      t.timestamps
    end
  end
end
