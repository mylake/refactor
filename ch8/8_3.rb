class Customer
  attr_reader :name

  Instances = {}

  def initialize(name)
    @name = name
  end

  def self.with_name(name)
    Instances[name]
  end

  def self.load_customers
    new('ilake').store
    new('esther').store
  end

  def store
    Instances[name] = self
  end
end

class Order

  def initialize(customer_name)
    @customer = Customer.with_name(customer_name)
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
