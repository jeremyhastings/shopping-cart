# frozen_string_literal: true

require 'rspec'
require_relative '../cart'
require_relative '../main'

# Just an example
describe TimeBasedDiscount do
  before do
    @cart = Cart.new
  end

  context 'basket is £200' do
    before do
      @subtotal = [200]
    end

    it 'reduces by £40' do
      expect(TIME_DISCOUNT.qualify(@cart, @subtotal)).to equal(-40)
    end
  end
end
