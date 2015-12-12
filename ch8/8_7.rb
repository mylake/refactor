class Order
  attr_reader :customer

  def customer=(value)
    customer.friend_orders.substract(self) unless customer.nil?
    @customer = value
    customer.friend_orders.add(self) unless customer.nil?
  end

  def add_customer(customer)
    customer.friend_orders.add(self)
    @customers.add(customer)
  end

  def remove_customer(customer)
    customer.friend_orders.subtract(self)
    @customers.subtract(customer)
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
    order.add_customer(self)
  end

  def remove_order(order)
    order.remove_customer(self)
  end
end
