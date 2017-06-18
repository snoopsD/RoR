require_relative 'validation.rb'

# class Station
class Station
  include Validate
  attr_reader :trains, :name
  @@amount_stations = []

  validate :name, :presence  

  def self.all
    @@amount_stations
  end

  def initialize(name)
    @name = name.to_s
    validate!
    @trains = []
    @@amount_stations << self
  end

  def add_train(train)
    @trains << train
  end

  def show_trains
    @trains
  end

  def show_types
    trains.select { |train| train.type if train.type == type }.count
  end

  def remove(train)
    @trains.delete(train)
  end

  def each_train
    @trains.each_with_index { |train, id| yield(train, id) }
  end

#  def validate!
#    raise 'Название станции не может быть пустым!' if name.nil?
#    raise 'Минимум 3, максимум 12' if (name.length < 3) || name.length > 12
#    true
#  end
end
