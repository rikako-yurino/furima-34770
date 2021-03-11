class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_burden
  belongs_to :delivery_area
  belongs_to :shipping_time
  has_one_attached :image
  # has_one :order

  with_options presence: true do 
    validates :product_name
    validates :description_product
    validates :image
    validates :price,
      numericality: { only_integer: true, message: "Half-width number"}
    end
  validates :price,
      numericality: { greater_than: 300, less_than: 9999999, message:"Out of setting range"}
  with_options numericality: { other_than: 1, message: "Select"} do 
    validates :category_id
    validates :item_status_id
    validates :delivery_burden_id
    validates :delivery_area_id
    validates :shipping_time_id
  end
end
