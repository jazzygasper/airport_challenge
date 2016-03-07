require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :plane
attr_accessor :storage, :capacity

DEFAULT_CAPACITY = 10

def initialize
  @storage = []
  @capacity = DEFAULT_CAPACITY
end

def land(plane, weather=Weather.new)
  # raise "no landing due to storm" if weather.stormy? == "stormy"
  raise "no space to land plane" if full?
  raise "plane has already landed" if plane.landed?
  plane.landed?
  @storage << plane
end

def take_off(plane, weather=Weather.new)
  # raise "no take off due to storm" if weather.stormy? == "stormy"
  raise "plane has already taken off" if plane.taken_off?
  plane.taken_off?
  @storage.pop
end

private

def full?
    storage.size == capacity
  end

end