# frozen_string_literal: true

require 'chronic'
require_relative 'cart'
require_relative 'checkout'
require_relative 'item'
require_relative 'quantity_based_discount'
require_relative 'total_based_discount'

# Just an example
TimeBasedDiscount = Struct.new(:start_at, :end_at, :off) do
  def qualify(_cart, sub_total)
    discount_amount = 0
    sub_total = sub_total.reduce(:+)
    discount_amount -= (sub_total * off).to_i if Time.now.between?(Chronic.parse(start_at), Chronic.parse(end_at))
    discount_amount
  end
end

ITEM_1 = Item.new(:A, 50)
ITEM_2 = Item.new(:B, 30)
ITEM_3 = Item.new(:C, 20)

QUANTITY_DISCOUNT_1 = QuantityBasedDiscount.new(:A, 2, -5)
QUANTITY_DISCOUNT_2 = QuantityBasedDiscount.new(:B, 3, -5)
TOTAL_DISCOUNT = TotalBasedDiscount.new(200, 0.1)
TIME_DISCOUNT = TimeBasedDiscount.new('10/9/2021', 'October 12th, 2022', 0.2) # Demo, not used.

DISCOUNTS = [QUANTITY_DISCOUNT_1, QUANTITY_DISCOUNT_2, TOTAL_DISCOUNT].freeze

# cart = Cart.new
# cart.scan(ITEM_1)
# cart.scan(ITEM_2)
# cart.scan(ITEM_3)

# cart.scan(ITEM_2)
# cart.scan(ITEM_1)
# cart.scan(ITEM_2)
# cart.scan(ITEM_2)
# cart.scan(ITEM_1)

# cart.scan(ITEM_3)
# cart.scan(ITEM_2)
# cart.scan(ITEM_1)
# cart.scan(ITEM_1)
# cart.scan(ITEM_3)
# cart.scan(ITEM_2)
# cart.scan(ITEM_3)

# checkout = Checkout.new(cart, DISCOUNTS)
# price = checkout.total
#
# puts price
