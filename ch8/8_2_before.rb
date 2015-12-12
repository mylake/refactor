class Order
  attr_accessor :customer

  def initialize(customer)
    @customer = customer
  end

  private

  def self.number_of_orders_for(orders, customer)
    order.select { |order| order.customer == customer }.size
  end
end
