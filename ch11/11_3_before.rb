class Bid
  before_save :capture_account_number

  def capture_account_number
    self.account_number = buyer.preferred_account_number
  end
end
