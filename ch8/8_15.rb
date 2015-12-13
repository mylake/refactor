class Person

  def initialize(female, code)
    @female = female
    @code = code
  end

  def female?
    @female
  end

  def code
    @code
  end

  def self.create_female
    Person.new(true, 'F')
  end

  def self.create_male
    Person.new(false, 'M')
  end
end


bree = Person.create_female
