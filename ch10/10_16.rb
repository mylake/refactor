class Person < DomainObject
  attr_accessor :first_name, :last_name, :ssn
  def save
    http.post(:first_name, :last_name, :ssn).to(
      'http://www.example.com/person'
    )
  end
end


class GatewayExpressionBuilder
  def initialize(subject)
    @subject = subject
  end

  def with_authentication
    @with_authentication = true
  end

  def post(attributes)
    @attributes = attributes
    @gateway = PostGateway
  end

  def get(attributes)
    @attributes = attributes
    @gateway = GetGateway
  end

  def to(address)
    @gateway.save do |persist|
      persist.subject = @subject
      persist.attributes = @attributes
      persist.authenticate = @with_authentication
      persist.to = address
    end
  end
end

class Company < DomainObject
  attr_accessor :name, :tax_id

  def save
    http.get(:name, :tax_id).to('http://www.example.com/companies')
  end
end

class DomainObject
  def http
    GatewayExpressionBuilder.new(self)
  end
end

class Laptop < DomainObject
  attr_accessor :assigned_to, :serial_number

  def save
    http.post(:assigned_to, :serial_number).with_authentication.to(
      'http://www.example.com/issued_laptop'
    )
  end
end
