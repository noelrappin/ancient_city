class AddOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total_price_paid, :precision => 10, :scale => 2
      t.references :user
      t.timestamps
    end

    create_table :order_line_items do |t|
      t.references :order
      t.references :buyable, polymorphic: true
      t.integer :amount
      t.decimal :unit_price, :precision => 10, :scale => 2
      t.decimal :extended_price, :precision => 10, :scale => 2
      t.decimal :processing_fee, :precision => 10, :scale => 2
      t.decimal :price_paid, :precision => 10, :scale => 2
      t.timestamps
    end
  end
end
