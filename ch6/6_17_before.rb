def error
  self.state = :error
end

def failure
  self.state = :failure
end

def success
  self.state = :success
end
