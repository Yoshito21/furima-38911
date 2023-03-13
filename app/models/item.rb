class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_history
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name, length: { maximum: 40 }
    validates :item_explanation, length: { maximum: 1000 }
    validates :item_price, format: { with: /\A[0-9]+\z/ },
                           numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :day_to_ship

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :day_to_ship_id
  end
end
