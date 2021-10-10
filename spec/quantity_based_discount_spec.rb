# frozen_string_literal: true

require 'rspec'
require_relative '../cart'
require_relative '../main'

describe QuantityBasedDiscount do
  before do
    @cart = Cart.new
    @subtotal = 0
  end

  context 'when item A, B, C added to cart' do
    before do
      @cart.scan(Item1)
      @cart.scan(Item2)
      @cart.scan(Item3)
    end

    it 'does not qualify for QuantityBasedDiscount1' do
      expect(QuantityDiscount1.qualify(@cart, @subtotal)).to equal(0)
    end

    it 'does not qualify for QuantityBasedDiscount2' do
      expect(QuantityDiscount2.qualify(@cart, @subtotal)).to equal(0)
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

    it 'does qualify for QuantityBasedDiscount1' do
      expect(QuantityDiscount1.qualify(@cart, @subtotal)).to equal(-10)
    end

    it 'does qualify for QuantityBasedDiscount2' do
      expect(QuantityDiscount2.qualify(@cart, @subtotal)).to equal(-15)
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

    it 'does qualify for QuantityBasedDiscount1' do
      expect(QuantityDiscount1.qualify(@cart, @subtotal)).to equal(-10)
    end

    it 'does not qualify for QuantityBasedDiscount2' do
      expect(QuantityDiscount2.qualify(@cart, @subtotal)).to equal(0)
    end
  end
end
