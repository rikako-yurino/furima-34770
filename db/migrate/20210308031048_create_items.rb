class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name,         null: false
      t.integer    :price,                null: false
      t.text       :description_product,  null: false
      t.integer    :category_id,          null: false
      t.integer    :item_status_id,       null: false
      t.integer    :delivery_burden_id,   null: false
      t.integer    :delivery_area_id,     null: false
      t.integer    :shipping_time_id,     null: false
      t.references :user,                 null: false, foreign_key: true
      t.timestamps
    end
  end
end
