class Order
  attr_reader :customer

  def customer=(value)
    customer.friend_orders.substract(self) unless customer.nil?
    @customer = value
    customer.friend_orders.add(self) unless customer.nil?
  end
end




class Customer
  def initialize
    @orders = Set.new
  end

  def friend_orders
    @orders
  end

  def add_order(order)
    order.set_customer(self)
  end

end
