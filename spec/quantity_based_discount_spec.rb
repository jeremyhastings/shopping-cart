# frozen_string_literal: true

require 'rspec'
require_relative '../cart'
require_relative '../main'

describe QuantityBasedDiscount do
  before do
    @cart = Cart.new
    @subtotal = [0]
  end

  context 'when item A, B, C added to cart' do
    before do
      @cart.scan(ITEM_1)
      @cart.scan(ITEM_2)
      @cart.scan(ITEM_3)
    end

    it 'does not qualify for QUANTITY_DISCOUNT_1' do
      expect(QUANTITY_DISCOUNT_1.qualify(@cart, @subtotal)).to equal(0)
    end

    it 'does not qualify for QUANTITY_DISCOUNT_2' do
      expect(QUANTITY_DISCOUNT_2.qualify(@cart, @subtotal)).to equal(0)
    end
  end

  context 'when item B, A, B, B, A added to cart' do
    before do
      @cart.scan(ITEM_2)
      @cart.scan(ITEM_1)
      @cart.scan(ITEM_2)
      @cart.scan(ITEM_2)
      @cart.scan(ITEM_1)
    end

    it 'does qualify for QUANTITY_DISCOUNT_1' do
      expect(QUANTITY_DISCOUNT_1.qualify(@cart, @subtotal)).to equal(-10)
    end

    it 'does qualify for QUANTITY_DISCOUNT_2' do
      expect(QUANTITY_DISCOUNT_2.qualify(@cart, @subtotal)).to equal(-15)
    end
  end

  context 'when item C, B, A, A, C, B, C added to cart' do
    before do
      @cart.scan(ITEM_3)
      @cart.scan(ITEM_2)
      @cart.scan(ITEM_1)
      @cart.scan(ITEM_1)
      @cart.scan(ITEM_3)
      @cart.scan(ITEM_2)
      @cart.scan(ITEM_3)
    end

    it 'does qualify for QUANTITY_DISCOUNT_1' do
      expect(QUANTITY_DISCOUNT_1.qualify(@cart, @subtotal)).to equal(-10)
    end

    it 'does not qualify for QUANTITY_DISCOUNT_2' do
      expect(QUANTITY_DISCOUNT_2.qualify(@cart, @subtotal)).to equal(0)
    end
  end
end
