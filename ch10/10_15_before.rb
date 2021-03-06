class Person
  attr_accessor :first_name, :last_name, :ssn

  def save
    url = URI.parse('http://www.example.com/person')
    request = Net::HTTP::Post.new(url.path)
    request.set_form_data(
      'first_name' => first_name,
      'last_name' => last_name,
      'ssn' => ssn
    )
    Net::HTTP.new(url.host, url.port).start {|http| http.request(request)}
  end
end

class Company
  attr_accessor :name, :tax_id

  def save
    url = URI.parse('http://www.example.com/companies')
    request = Net::HTTP::Get.new(url.path + "?name=#{name}&tax_id=#{tax_id}")
    Net::HTTP.new(url.host, url.post).start {|http| http.request(request)}
  end
end

class Laptop
  attr_accessor :assigned_to, :serial_number

  def save
    url = URI.parse('http://www.example.com/issue_laptop')
    request = Net::HTTP::Post.new(url.path)
    request.basic_auth 'username', 'password'
    request.set_form_data(
      'assigned_to' => assigned_to,
      'serial_number' => serial_number
    )
    Net::HTTP.new(url.host, url.port).start {|http| http.request(request)}
  end
end
