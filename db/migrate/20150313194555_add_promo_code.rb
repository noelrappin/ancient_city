class AddPromoCode < ActiveRecord::Migration
  def change
    create_table :coupon_codes do |t|
      t.integer :discount_percentage
      t.string :applies_to
      t.string :code
      t.timestamps
    end

    add_column :order_line_items, :promo_code_id, :integer
    add_column :order_line_items, :discount_cents, :integer, default: 0
  end
end
