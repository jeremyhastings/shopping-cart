# frozen_string_literal: true

class TotalBasedDiscount
  attr_reader :amount, :off

  def initialize(amount, off)
    @amount = amount
    @off = off
  end

  def qualify(_cart, sub_total)
    sub_total = sub_total.reduce(:+)
    sub_total >= amount ? (sub_total * off).to_i : 0
  end
end
