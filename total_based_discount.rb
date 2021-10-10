# frozen_string_literal: true

class TotalBasedDiscount
  attr_reader :amount, :off

  def initialize(amount, off)
    @amount = amount
    @off = off
  end

  def qualify(_cart, sub_total)
    discount_amount = 0
    sub_total = sub_total.reduce(:+)
    discount_amount -= (sub_total * off).to_i if sub_total >= amount
    discount_amount
  end
end
