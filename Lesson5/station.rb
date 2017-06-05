class Station
  attr_reader :trains,:name
  @@amount_stations = []

  def self.all
    @@amount_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@amount_stations << self
  end

  def add_train( train )
    @trains << train
  end

  def show_trains
    @trains
  end

  def show_types(type)
    self.trains.select{ |train| train.type if train.type == type }.count
  end

  def remove(train)
    @trains.delete(train)
  end
end
