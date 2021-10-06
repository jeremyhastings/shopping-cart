# frozen_string_literal: true

require 'rspec'
require_relative 'checkout'
require_relative 'main'

describe Checkout do
  before do
    @checkout = Checkout.new(PRICE_RULES)
  end

  it 'totals £100 when item A, B, C added' do
    @checkout.scan(:A)
    @checkout.scan(:B)
    @checkout.scan(:C)
    expect(@checkout.total).to equal(100)
  end

  it 'totals £100 when item B, A, B, B, A added' do
    @checkout.scan(:B)
    @checkout.scan(:A)
    @checkout.scan(:B)
    @checkout.scan(:B)
    @checkout.scan(:A)
    expect(@checkout.total).to equal(165)
  end

  it 'totals £189 when item C, B, A, A, C, B, C added' do
    @checkout.scan(:C)
    @checkout.scan(:B)
    @checkout.scan(:A)
    @checkout.scan(:A)
    @checkout.scan(:C)
    @checkout.scan(:B)
    @checkout.scan(:C)
    expect(@checkout.total).to equal(189)
  end
end
