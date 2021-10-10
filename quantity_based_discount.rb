# frozen_string_literal: true

class QuantityBasedDiscount
  attr_reader :name, :quantity, :discount

  def initialize(name, quantity, discount)
    @name = name
    @quantity = quantity
    @discount = discount
  end

  def qualify(cart, _sub_total)
    items = cart.purchases.select { |item| item.name == name }
    items.count >= quantity ? (items.count * discount) : 0
  end
end
