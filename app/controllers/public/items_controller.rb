class Public::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem
  end

  def index
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def search_genre
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = @genre.items.page(params[:page]).per(8)
  end

  def search_item
    @genres = Genre.all
    if params[:word] == ""
      redirect_to public_items_path
    else
      @items = Item.looks(params[:word]).page(params[:page]).per(8)
    end
  end
end
