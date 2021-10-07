# frozen_string_literal: true

class Checkout
  attr_reader :price_rules

  def initialize(price_rules)
    @price_rules = price_rules
  end

  def scan(item)
    purchases[item] += 1
  end

  def total
    total_costs = 0
    purchases.each do |item, quantity|
      total_costs += if !discount_quantity(item) || quantity < discount_quantity(item)
                       (item_price(item) * quantity)
                     else
                       (discount_price(item) * quantity)
                     end
    end
    total_costs > total_basket_discount_level ? total_costs - (total_costs * basket_discount).to_i : total_costs
  end

  private

  def purchases
    @purchases ||= Hash.new(0)
  end

  def discount_quantity(item)
    price_rules[item][:discount_quantity]
  end

  def item_price(item)
    price_rules[item][:price]
  end

  def discount_price(item)
    price_rules[item][:discount_price]
  end

  def total_basket_discount_level
    price_rules[:discount][:total_basket]
  end

  def basket_discount
    price_rules[:discount][:off]
  end
end
