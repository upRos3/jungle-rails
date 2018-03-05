require 'rails_helper'
require 'faker'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.create({
        name: "Beer"
        })
        @product = @category.products.new({
          name: Faker::Beer.name,
          description: Faker::Hipster.paragraph,
          price_cents: Faker::Number.between(1, 10000000),
          quantity: Faker::Number.between(1, 100),
          category_id: @category.id
        })
      end

    it 'ensures a new product is created with the right validations' do
      @product.save

      expect(@product).to be_valid
    end

    it 'ensures that a name should be validated' do
      @product.name = nil
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors[:name]).to include("can't be blank")
    end

    it 'ensures that a price should be validated' do
      @product.price_cents = nil
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors[:price_cents]).to include("can't be blank")
    end

    it 'ensures that a quantity should be validated' do
      @product.quantity = nil
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it 'ensures that a category should be validated' do
      @product.category_id = nil
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors[:category_id]).to include("can't be blank")
    end
  end
end
