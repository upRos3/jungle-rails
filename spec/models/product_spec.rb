require 'rails_helper'
require 'faker'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'ensures a new product is created with the right validations' do
      @product = Product.new
      @category = Category.new
        @category.id = Faker::Number.between(1, 3)
        @category.save

      @product.name = Faker::Beer.name
      @product.price = Faker::Number.decimal(2)
      @product.quantity = Faker::Number.between(1, 100)

      @product.category_id = @category.id

      @product.save

      expect(@product).to be_valid
    end

    it 'ensures that a name should be validated' do
      @product = Product.new
      @product.name = nil
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors[:name]).to include("can't be blank")
    end

    it 'ensures that a price should be validated' do
      @product = Product.new
      @product.price = nil
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors[:price]).to include("can't be blank")
    end

    it 'ensures that a quantity should be validated' do
      @product = Product.new
      @product.quantity = nil
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it 'ensures that a category should be validated' do
      @product = Product.new
      @product.category = nil
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end

# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true
