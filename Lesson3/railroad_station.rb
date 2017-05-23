#класс Station
class Station
  attr_accessor :type_trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
    puts "Поезд #{train} прибыл на станцию"
  end

  def show_trains
    puts "На станции #{@trains} поездов"
  end

  def show_types
    if @trains.inspect.include("c").
  # puts "Грузовых поездов #{@trains.select{|n| n == "c"}.count('c')}"
  # puts "Пассажирских поездов #{@trains.select{|n| n == "p"}.count('p')}"
  end

  def remove(train)
    @trains.pop(train)
    puts "Поезд #{train} уехал со станции"
  end
end

#класс Route
class Route
  attr_reader :stations

  def initialize(start_st, end_st)
    @stations = []
    @stations << start_st << end_st
  end

  def inter_point(inter_st)
    @stations.insert(-2, inter_st)
    puts "Промежуточная станция добавлена"
  end

  def del_inter_point(inter_st)
    @stations.delete(inter_st)
    puts "Промежуточная станция удалена"
    end

 def print_stations
    puts "#{@stations}"
 end

end

#класс Train
class Train
  attr_accessor :speed
  attr_writer :r_add

  def initialize (number, type, number_wagons)
    @train = []
    @number = number
    @type = type
    @number_wagons = number_wagons
    @speed = 0
    @train << number << type << number_wagons
  end

  def up_speed(speed)
    @speed = speed
    puts "Скорость увеличена на #{speed}"
  end

  def current_speed
    puts "Текущая скорость #{speed}"
  end

  def stop
    @speed = 0
    puts "Поезд остановился"
  end

  def ret_number_wagons
    puts "Кол-во вагонов #{@number_wagons}"
  end

  def hook_add
   if @speed !=0
     puts "Для сцепки вагона необходимо остановиться!"
   elsif
     @number_wagons -= 1
     puts "У поезда #{@number_wagons}"
   end
  end

  def route_add(r_add)
    @r_add = r_add
    puts "Маршрут принят"
  end

end
