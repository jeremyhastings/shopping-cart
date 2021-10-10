# frozen_string_literal: true

class QuantityBasedDiscount
  attr_reader :name, :quantity, :discount

  def initialize(name, quantity, discount)
    @name = name
    @quantity = quantity
    @discount = discount
  end

  def qualify(cart, _sub_total)
    discount_amount = 0
    items = cart.purchases.select { |item| item.name == name }
    discount_amount += (items.count * discount) if items.count >= quantity
    discount_amount
  end
end
