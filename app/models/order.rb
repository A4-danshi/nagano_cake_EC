class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }

end
