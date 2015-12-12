class Customer
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Order

  def initialize(customer_name)
    @customer = Customer.new(customer_name)
  end

  def customer_name
    @customer.name
  end

  def customer=(customer_name)
    @customer = Customer.new(customer_name)
  end

  private

  def self.number_of_orders_for(orders, customer_name)
    order.select { |order| order.customer_name == customer_name }.size
  end
end
