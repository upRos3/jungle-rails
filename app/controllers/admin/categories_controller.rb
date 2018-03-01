class Admin::CategoryController < ApplicationController
  def index
    @category = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(product_params)

    if @category.save
      redirect_to %i[admin products], notice: 'Category created!'
    else
      render :new
    end
  end

  # def destroy
  #   @product = Product.find params[:id]
  #   @product.destroy
  #   redirect_to [:admin, :products], notice: 'Product deleted!'
  # end

  private

  def product_params
    params.require(:category).permit(
      :name
    )
  end
end
