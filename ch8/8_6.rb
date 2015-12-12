class NetworkResult
  attr_reader :old_networks, :nodes
  # attr_accessor :name

  def initialize
    @old_networks, @nodes = [], []
  end

  def name
    @old_networks.collect { |network| network.name }.join(" - ")
  end
end


new_network = NetworkResult.new
new_network.old_networks << node.network
new_network.nodes << node
# new_network.name = new_network.old_networks.collect do |network|
#   network.name
# end.join(" - ")
new_network.name = NetworkResult.name
