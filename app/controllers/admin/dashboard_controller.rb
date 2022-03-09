class Admin::DashboardController < ApplicationController

  # add http basic authenticate into admin page
  http_basic_authenticate_with name: ENV['username'], password: ENV['password']

  def show
    @products_number = Product.all.count
    @categories = Category.all.count
  end
end
