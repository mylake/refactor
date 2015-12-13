class MountainBike
  extend Forwardable
  def_delegators :@bike_type, :off_road_ability, :price
  attr_reader :type_code

  def initialize(bike_type)
    @bike_type = bike_type
  end

  def type_code=(value)
    @type_code = value
    @bike_type = case type_code
                 when :rigid: RigidMountainBike.new(
                   :tire_width => @tire_width,
                   :base_price => @base_price,
                   :commission => @commission
                 )
                 when :front_suspension: FrontSuspensionMountainBike.new(
                   :tire_width => @tire_width,
                   :front_fork_travel => @front_fork_travel,
                   :front_suspension_price => @front_suspension_price,
                   :base_price => @base_price,
                   :commission => @commission
                 )
                 when :full_suspension: FullSuspensionMountainBike.new(
                   :tire_width => @tire_width,
                   :front_fork_travel => @front_fork_travel,
                   :rear_fork_travel => @rear_fork_travel,
                   :front_suspension_price => @front_suspension_price,
                   :rear_suspension_price => @rear_suspension_price,
                   :base_price => @base_price,
                   :commission => @commission
                 )
                 end
  end

  def add_front_suspension(params)
    @bike_type = FrontSuspensionMountainBike.new(
      @bike_type.upgradable_paramsters.merge(params)
    )
  end

  def add_rear_suspension(params)
    unless type_code == :front_suspension
      raise "You can't add rear suspension unless you have front suspension"
    end
    @bike_type = FullSuspensionMountainBike.new(
      @bike_type.upgradable_paramsters.merge(params))
  end

end

class RigidMountainBike
  def initialize(params)
    @tire_width = params[:tire_width]
  end

  def price
    (1 + @commission) * @base_price
  end

  def off_road_ability
    @tire_width * MountainBike::TIRE_WIDTH_FACTOR
  end

  def upgradable_paramsters
    {
      :tire_width => @tire_width,
      :base_price => @base_price,
      :commission => @commission
    }
  end
end

class FrontSuspensionMountainBike
  def initialize(params)
    @tire_width = params[:tire_width]
    @front_fork_travel = params[:front_fork_travel]
  end

  def price
    (1 + @commission) * @base_price + @front_suspension_price
  end

  def off_road_ability
    @tire_width * MountainBike::TIRE_WIDTH_FACTOR + @front_fork_travel *
      MountainBike::FRONT_SUSPENSION_FACTOR
  end

  def upgradable_paramsters
    {
      :tire_width => @tire_width,
      :front_fork_travel => @front_fork_travel,
      :front_suspension_price => @front_suspension_price,
      :base_price => @base_price,
      :commission => @commission
    }
  end

end

class FullSuspensionMountainBike
  def initialize(params)
    @tire_width = params[:tire_width]
    @front_fork_travel = params[:front_fork_travel]
    @rear_fork_travel = params[:rear_fork_travel]
  end

  def price
    (1 + @commission) * @base_price + @front_suspension_price + @rear_suspension_price
  end

  def off_road_ability
    @tire_width * MountainBike::TIRE_WIDTH_FACTOR +
    @front_fork_travel * MountainBike::FRONT_SUSPENSION_FACTOR +
    @rear_fork_travel * MountainBike::REAR_SUSPENSION_FACTOR
  end

end
