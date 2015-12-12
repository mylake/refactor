class Order
  def discounted_price(customer)
    gross_price * (1 - customer.discount)
  end

  def customer
    Customer::Instances.each do |customer|
      return customer if customer.has_order?(self)
    end
  end
end

class Customer

  def price_for(order)
    order.discounted_price(self)
  end
end
