class Public::HomesController < ApplicationController
  def top
    @items = Item.order(created_at: :DESC)
    @genres = Genre.all
    @count = 0
  end

  def about
  end
end
