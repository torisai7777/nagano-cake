class CustomersController < ApplicationController
  def show
    @customer=current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def unsubscribe

  end

  def withdraw
    @customer = current_customer
    @customer.update_columns(is_active: false)

    if @customer.update(is_active: false)
      sign_out current_customer
    end
    redirect_to root_path
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:success] = "You have edited user data successfully."
      redirect_to customers_my_page_path
    else
      render 'edit'
    end
  end


  private
  def customer_params
  	  params.require(:customer).permit(:is_active, :last_name, :first_name, :last_name_katakana, :first_name_katakana,
  	                                   :telephone_number, :email, :password, :postal_code, :address)
  end
end
