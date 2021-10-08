# frozen_string_literal: true

require_relative 'checkout'

PRICE_RULES = {
  A: { price: 50, discount_quantity: 2, discount_price: 45 },
  B: { price: 30, discount_quantity: 3, discount_price: 25 },
  C: { price: 20 },
  discount: { total_basket: 200, off: 0.1 }
}.freeze

# checkout = Checkout.new(PRICE_RULES)
# checkout.scan(:A)
# checkout.scan(:B)
# checkout.scan(:C)

# checkout.scan(:B)
# checkout.scan(:A)
# checkout.scan(:B)
# checkout.scan(:B)
# checkout.scan(:A)

# checkout.scan(:C)
# checkout.scan(:B)
# checkout.scan(:A)
# checkout.scan(:A)
# checkout.scan(:C)
# checkout.scan(:B)
# checkout.scan(:C)

# price = checkout.total

# puts price
