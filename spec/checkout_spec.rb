# frozen_string_literal: true

require 'rspec'
require_relative '../cart'
require_relative '../checkout'
require_relative '../main'

describe Checkout do
  before do
    @cart = Cart.new
  end

  context 'when item A, B, C added to cart' do
    before do
      @cart.scan(ITEM_1)
      @cart.scan(ITEM_2)
      @cart.scan(ITEM_3)
    end

    it 'totals £100 at checkout' do
      @checkout = Checkout.new(@cart, DISCOUNTS)
      expect(@checkout.total).to equal(100)
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

    it 'totals £165 at checkout' do
      @checkout = Checkout.new(@cart, DISCOUNTS)
      expect(@checkout.total).to equal(165)
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

    it 'totals £189 at checkout' do
      @checkout = Checkout.new(@cart, DISCOUNTS)
      expect(@checkout.total).to equal(189)
    end
  end
end
