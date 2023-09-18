class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # @item.genre_id = params[:id][:name]
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      rende "edit"
    end
  end

  private
   def item_params
     params.require(:item).permit(:name, :introduction, :price, :is_sale, :item_image, :genre_id)
   end
end
