class Station
  attr_reader :trains,:name

  def initialize(name)
    @name = name
    @trains = []
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
