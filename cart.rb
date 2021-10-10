
class Cart
  attr_reader :purchases

  def scan(item)
    purchases << item
  end

  def purchases
    @purchases ||= []
  end
end
