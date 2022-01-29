class Admin::ItemsController < ApplicationController
  def index

    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end


  def edit
    @item = Item.find(params[:id])
  end




  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      flash[:item_created_error] = "商品情報が正常に保存されませんでした。"
      redirect_to new_admin_item_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      flash[:item_updated_error] = "商品情報が正常に保存されませんでした。"
      redirect_to edit_admin_item_path(@item)
    end
  end

  def search

    method = params[:search_method]
    keyword = params[:keyword]
    @items = Item.search(keyword,method)
    if @items.empty?
      redirect_to admin_root_path
    else
render :index

    end

  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :image, :name, :explanation, :price, :is_active)
  end
end
