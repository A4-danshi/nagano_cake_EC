class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum production_status:
        {
          impossible_production:0,
          waiting_production:1,
          producing:2,
          finish:3
        }
end
