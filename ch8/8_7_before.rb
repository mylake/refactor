class Order
  attr_accessor :customer
end

require 'set'

class Customer
  def initialize
    @orders = Set.new
  end
end
