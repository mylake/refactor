class Account
  include Assertions

  def withdraw(amount)
    new_withdraw(amount)
    return 0
  rescue BalanceException
    return -1
  end

  def new_withdraw(amount)
    raise BalanceError.new if amount > @balance
    @balance -= amount
  end
end


class BalanceError < StandardError ; end

module Assertions
  class AssertionFailedError < StandardError ; end

  def assert(message, &condition)
    unless condition.call
      raise AssertionFailedError.new("Assertion Failed: #{message}")
    end
  end
end

begin
  account.new_withdraw(amount)
  do_the_usual_thing
rescue BalanceError
  handle_overdrawn
end
