class ProductsController < ApplicationController

  def index
    #because def current_user in application_controller, we could use current_user below
    current_user
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
