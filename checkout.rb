# frozen_string_literal: true

class Checkout
  attr_reader :cart, :discounts

  def initialize(cart, discounts)
    @discounts = discounts
    @cart = cart
  end

  def total
    total_cart
    apply_discounts
    final_price
  end

  private

  def apply_discounts
    discounts.each { |discount| sub_total << discount.qualify(cart, sub_total) }
  end

  def total_cart
    cart.purchases.each { |item| sub_total << item.price }
  end

  def sub_total
    @sub_total ||= []
  end

  def final_price
    sub_total.reduce(:+)
  end
end
