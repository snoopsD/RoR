require_relative 'ModuleProducer'
require_relative 'InstanceCounter'
#класс Train
class Train
  include Producer
  include InstanceCounter

  attr_accessor :speed,:route,:wagons,:type,:number
  @@trains = []
  @@instances = 0

  def self.find(number)
    @@trains[number]
  end

  def initialize(number)
    @speed = 0
    @wagons = []
    @type = type
    @number = number
    @@trains[number] = self
    register_instance
  end

  def wagon_add(wagon)
    if @speed !=0
      puts "Для сцепки вагонов необходимо остановиться!"
    elsif self.type != wagon.type
      puts "Разные типы вагонов!"
    else
      self.wagons << wagon
    end
  end

  def wagon_remove
    if @speed != 0
      puts "Для отцепки вагонов необходимо остановиться!"
    elsif @wagons == nil
      puts "Отцеплять нечего. Нет ни одного вагона."
    else
      self.wagons.pop
      puts "Вагон отцеплен"
    end
  end

  def route_add(route)
    self.route = route
    @current_station = self.route.stations[0]
  end

  def current_station
    @current_station
  end

  def move_next
    if @current_station == self.route.stations.last
      puts "Это конечная станция. Вперед двигаться нельзя!"
    elsif
      next_station = self.route.stations.index(@current_station)+1
      @current_station = self.route.stations[next_station]
    end
  end

  def move_back
    if @current_station == self.route.stations[0]
      puts "Это начальная станция. Назад двигаться нельзя!"
    else
      next_station = self.route.stations.index(@current_station)-1
      @current_station = self.route.stations[next_station]
    end
  end

protected
# Вызов данных методов осуществляется только для  класса Train, т.к. он является
# родительским, то и для его подклассов


  def up_speed(speed)
    @speed  += speed
  end

  def current_speed
    puts "Текущая скорость: #{speed}"
  end

  def stop
    @speed = 0
    puts "Поезд остановился"
  end

end
