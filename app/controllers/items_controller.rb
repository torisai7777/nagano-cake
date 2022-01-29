class ItemsController < ApplicationController
  def index

     @genres = Genre.all
     if params[:genre_id]

       @genre = Genre.find(params[:genre_id])
       @items = Item.where(genre_id: @genre.id, is_active: true)

     else
       @items =Item.where(is_active: true)
     end


  end

  def show
    @cart_item = CartItem.new
  	@genres = Genre.all
  	@item = Item.find(params[:id])
  end


private


end
