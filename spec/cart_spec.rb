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
      @cart.scan(Item1)
      @cart.scan(Item2)
      @cart.scan(Item3)
    end

    it 'contains 3 purchases' do
      expect(@cart.purchases.count).to equal(3)
    end
  end

  context 'when item B, A, B, B, A added to cart' do
    before do
      @cart.scan(Item2)
      @cart.scan(Item1)
      @cart.scan(Item2)
      @cart.scan(Item2)
      @cart.scan(Item1)
    end

    it 'contains 5 purchases' do
      expect(@cart.purchases.count).to equal(5)
    end
  end

  context 'when item C, B, A, A, C, B, C added to cart' do
    before do
      @cart.scan(Item3)
      @cart.scan(Item2)
      @cart.scan(Item1)
      @cart.scan(Item1)
      @cart.scan(Item3)
      @cart.scan(Item2)
      @cart.scan(Item3)
    end

    it 'contains 7 purchases' do
      expect(@cart.purchases.count).to equal(7)
    end
  end
end
