class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @ratings = @product.ratings.order(created_at: :desc)

    if @ratings.average(:rating).blank?
      @average_rating = "This product hasn't been rated yet!"
    else
      @average_rating = @ratings.average(:rating).round(1)
    end
  end
end
