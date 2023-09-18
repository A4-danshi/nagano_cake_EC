class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
end
