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
    if @available.empty?
      result = Rsource.new
    else
      result = @available.pop
    end
    @allocated.push(result)
    return result
  end
end
