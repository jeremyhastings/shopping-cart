# frozen_string_literal: true

require 'rspec'
require_relative '../cart'
require_relative '../main'

describe TotalBasedDiscount do
  before do
    @cart = Cart.new
  end

  context 'basket is less than 200' do
    before do
      @subtotal = [199]
    end

    it 'does not qualify for TOTAL_DISCOUNT' do
      expect(TOTAL_DISCOUNT.qualify(@cart, @subtotal)).to equal(0)
    end
  end

  context 'basket is 200 or more' do
    before do
      @subtotal = [210]
    end

    it 'does qualify for TOTAL_DISCOUNT' do
      expect(TOTAL_DISCOUNT.qualify(@cart, @subtotal)).to equal(-21)
    end
  end
end
