module MountainBike
  def initialize(params)
    params.each { |key, value| instance_variable_set "@#{key}", value }
  end

  def wheel_circumference
    Math::PI * (@wheel_diameter + @tire_diameter)
  end

end

class RigidMountainBike
  include MountainBike

  def price
    (1 + @commission) * @base_price
  end

  def off_road_ability
    @tire_width * TIRE_WIDTH_FACTOR
  end
end

class FrontSuspensionMountainBike
  include MountainBike
  def price
    (1 + @commission) * @base_price + @front_suspension_price
  end
  def off_road_ability
    @tire_width * TIRE_WIDTH_FACTOR + @front_fork_travel * FRONT_SUSPENSION_FACTOR
  end
end

class FullSuspensionMountainBike
  include MountainBike
  def price
    (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
  end
  def off_road_ability
    @tire_width * TIRE_WIDTH_FACTOR + @front_fork_travel * FRONT_SUSPENSION_FACTOR +
      @rear_fork_travel * REAR_SUSPENSION_FACTOR
  end
end
bike = FrontSuspensionMountainBike.new(:tire_width => 2, :front_fork_travel => 3)
