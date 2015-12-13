class Person
end

class Female < Person
  def female?
    true
  end

  def code
    'F'
  end
end

class Male < Person
  def female?
    false
  end

  def code
    'M'
  end
end



bree = Female.new
