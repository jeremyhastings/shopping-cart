# frozen_string_literal: true

require_relative 'cart'
require_relative 'checkout'
require_relative 'item'
require_relative 'quantity_based_discount'
require_relative 'total_based_discount'

# Item = Struct.new(:name, :price)

# QuantityDiscount = Struct.new(:name, :quantity, :discount) do
#   def qualify(cart, _sub_total)
#     discount_amount = 0
#     items = cart.purchases.select { |item| item.name == name }
#     discount_amount += (items.count * discount) if items.count >= quantity
#     discount_amount
#   end
# end

# BasketDiscount = Struct.new(:amount, :off) do
#   def qualify(_cart, sub_total)
#     discount_amount = 0
#     sub_total = sub_total.reduce(:+)
#     discount_amount -= (sub_total * off).to_i if sub_total >= amount
#     discount_amount
#   end
# end

Item1 = Item.new(:A, 50)
Item2 = Item.new(:B, 30)
Item3 = Item.new(:C, 20)

QuantityDiscount1 = QuantityBasedDiscount.new(:A, 2, -5)
QuantityDiscount2 = QuantityBasedDiscount.new(:B, 3, -5)
basket_discount = TotalBasedDiscount.new(200, 0.1)

# discounts = [quantity_discount1, quantity_discount2, basket_discount]
Discounts = [QuantityDiscount1, QuantityDiscount2, basket_discount].freeze

cart = Cart.new
# cart.scan(Item1)
# cart.scan(Item2)
# cart.scan(Item3)

# cart.scan(Item2)
# cart.scan(Item1)
# cart.scan(Item2)
# cart.scan(Item2)
# cart.scan(Item1)

cart.scan(Item3)
cart.scan(Item2)
cart.scan(Item1)
cart.scan(Item1)
cart.scan(Item3)
cart.scan(Item2)
cart.scan(Item3)

checkout = Checkout.new(cart, Discounts)
price = checkout.total

puts price
