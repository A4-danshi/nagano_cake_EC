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
end
