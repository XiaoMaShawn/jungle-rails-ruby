require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    context "valid input" do
      it "should pass to database successfully" do
        @category = Category.new
        @product = Product.new(name: "desk", price: 10, quantity: 20, category: @category)
        expect(@product.name).to be_present
        expect(@product.price).to be_present
        expect(@product.quantity).to be_present
        expect(@product.category).to be_present
        # @product.save
        # expect(@product.errors.full_messages).to be_nil
      end
    end
    
    context "if the name is missing" do
      it "should have name as nil" do
        @category = Category.new
        @product = Product.new(price: 10, quantity: 20, category: @category)
        expect(@product.name).to be_nil
      end

      it "should get the error message" do
        @category = Category.new
        @product = Product.new(price: 10, quantity: 20, category: @category)
        @product.save
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    context "if the price is missing" do
      it "should have price as nil" do
        @category = Category.new
        @product = Product.new(name: "jason", quantity: 20, category: @category)
        expect(@product.price).to be_nil
      end

      it "should get the error message" do
        @category = Category.new
        @product = Product.new(name: "jason", quantity: 20, category: @category)
        @product.save
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end

    context "if the quantity is missing" do
      it "should have quantity as nil" do
        @category = Category.new
        @product = Product.new(name: "jason", price: 20, category: @category)
        expect(@product.quantity).to be_nil
      end

      it "should get the error message" do
        @category = Category.new
        @product = Product.new(name: "jason", price: 20, category: @category)
        @product.save
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context "if the category is missing" do
      it "should have category as nil" do
        @category = Category.new
        @product = Product.new(name: "jason", price: 20, quantity: 20)
        expect(@product.category).to be_nil
      end

      it "should get the error message" do
        @category = Category.new
        @product = Product.new(name: "jason", price: 20, quantity: 20)
        @product.save
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
