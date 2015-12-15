class ResourceStack
  def pop
  end
end

class ResourcePool
  def initialize
    @available = ResourceStack.new
    @allocated = ResourceStack.new
  end

  def resource
    result = @available.pop
    @allocated.push(result)
    return result
  rescue EmptyStackError
    result = Rsource.new
    @allocated.push(result)
    return result
  end
end
