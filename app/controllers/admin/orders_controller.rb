class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    
  end
  
  
 
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @items_total_price = calculate(@order)
  
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
     @order.update(order_params)
    if @order.status == "payment_confirmation"
      
       @order_details.each do |order_detail|
       order_detail.update(production_status: 1)
       end
      
       redirect_to admin_order_path(@order)
    else 
      redirect_to admin_order_path(@order)
    end
   
    
    
  end
  
  def calculate(items_total_price) # 商品合計を算出するメソッド
    @items_total_price = 0
    @order_details.each {|order_detail|
    tax_in_price = (order_detail.item.price * 1.1).floor
    sub_total_price = tax_in_price * order_detail.amount
    @items_total_price += sub_total_price
    }
    return @items_total_price
  end

  private
  
  
  def order_params
   params.require(:order).permit(:status)
  end
end
