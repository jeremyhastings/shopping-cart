# frozen_string_literal: true

Item = Struct.new(:name, :price)

QuantityDiscount = Struct.new(:name, :quantity, :discount) do
  def qualify(cart, _sub_total)
    discount_amount = 0
    items = cart.purchases.select { |item| item.name == name }
    discount_amount += (items.count * discount) if items.count >= quantity
    discount_amount
  end
end

BasketDiscount = Struct.new(:amount, :off) do
  def qualify(_cart, sub_total)
    discount_amount = 0
    sub_total = sub_total.reduce(:+)
    discount_amount -= (sub_total * off).to_i if sub_total >= amount
    discount_amount
  end
end

item1 = Item.new(:A, 50)
item2 = Item.new(:B, 30)
item3 = Item.new(:C, 20)

quantity_discount1 = QuantityDiscount.new(:A, 2, -5)
quantity_discount2 = QuantityDiscount.new(:B, 3, -5)
basket_discount = BasketDiscount.new(200, 0.1)

# discounts = [quantity_discount1, quantity_discount2, basket_discount]
discounts = [quantity_discount1, quantity_discount2, basket_discount]

class Cart
  attr_reader :purchases

  def scan(item)
    purchases << item
  end

  def purchases
    @purchases ||= []
  end
end


cart = Cart.new
# cart.scan(item1)
# cart.scan(item2)
# cart.scan(item3)

# cart.scan(item2)
# cart.scan(item1)
# cart.scan(item2)
# cart.scan(item2)
# cart.scan(item1)

cart.scan(item3)
cart.scan(item2)
cart.scan(item1)
cart.scan(item1)
cart.scan(item3)
cart.scan(item2)
cart.scan(item3)

checkout = Checkout.new(cart, discounts)
price = checkout.total

puts price
