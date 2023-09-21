class Address < ApplicationRecord
  belongs_to :customer

  validates :post_code,:address,:name, presence: true
  validates :post_code, length: {minimum: 3}

  def address_display
  '〒' + post_code + ' ' + address + ' ' + name
  end

end
