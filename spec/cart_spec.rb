# frozen_string_literal: true

require 'rspec'
require_relative '../cart'
require_relative '../main'

describe Cart do
  before do
    @cart = Cart.new
  end

  context 'when item A, B, C added to cart' do
    before do
      @cart.scan(ITEM_1)
      @cart.scan(ITEM_2)
      @cart.scan(ITEM_3)
    end

    it 'contains 3 purchases' do
      expect(@cart.purchases.count).to equal(3)
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

    it 'contains 5 purchases' do
      expect(@cart.purchases.count).to equal(5)
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

    it 'contains 7 purchases' do
      expect(@cart.purchases.count).to equal(7)
    end
  end
end
