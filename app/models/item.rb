class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_one_attached :item_image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def get_item_image
    (item_image.attached?) ? item_image : "no_image.jpg"
  end

  def with_tax_price
    (price * 1.1).floor
  end

  def self.looks(words)
    @item = Item.where("name LIKE?", "%#{words}%")
  end
end
