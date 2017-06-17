require_relative 'module_producer'
require_relative 'instance_counter'
require_relative 'validation'

# класс Train
class Train
  include Producer
  include InstanceCounter
  include Valid

  TRAIN_REGEXP = /^[a-z0-9]{3}-?[a-z0-9]{2}$/
  attr_accessor :speed, :route, :wagons, :type, :number
  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  def initialize(number)
    @number = number
    validate!
    @speed = 0
    @wagons = []
    @type = type
    @@trains[number] = self
    register_instance
  end

  def wagon_add(wagon)
    if @speed != 0
      puts 'Для сцепки вагонов необходимо остановиться!'
    elsif type != wagon.type
      puts 'Разные типы вагонов!'
    else
      wagons << wagon
    end
  end

  def wagon_remove
    if @speed != 0
      puts 'Для отцепки вагонов необходимо остановиться!'
    elsif @wagons.nil?
      puts 'Отцеплять нечего. Нет ни одного вагона.'
    else
      wagons.pop
      puts 'Вагон отцеплен'
    end
  end

  def each_wagon
    @wagons.each_with_index { |wagon, id| yield(wagon, id) }
  end

  def route_add(route)
    self.route = route
    @current_station = self.route.stations[0]
  end

  attr_reader :current_station

  def move_next
    if @current_station == route.stations.last
      puts 'Это конечная станция. Вперед двигаться нельзя!'
    elsif next_station == route.stations.index(@current_station) + 1
      @current_station = route.stations[next_station]
    end
  end

  def move_back
    if @current_station == route.stations[0]
      puts 'Это начальная станция. Назад двигаться нельзя!'
    else
      next_station = route.stations.index(@current_station) - 1
      @current_station = route.stations[next_station]
    end
  end

  protected

  # Вызов данных методов осуществляется только для  класса Train, т.к. он является
  # родительским, то и для его подклассов

  def up_speed(speed)
    @speed += speed
  end

  def current_speed
    puts "Текущая скорость: #{speed}"
  end

  def stop
    @speed = 0
    puts 'Поезд остановился'
  end

  def validate!
    raise 'Неверный номер поезда. Введите еще раз.' if number !~ TRAIN_REGEXP
    true
  end
end
