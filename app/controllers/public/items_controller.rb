class Public::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem
  end

  def index
    @items = Item.page(params[:page])
    @genres = Genre.all
  end

  def search_genre
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = @genre.items.page(params[:page])
  end
end
