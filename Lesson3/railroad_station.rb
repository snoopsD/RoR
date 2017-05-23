#класс Station
class Station
  attr_accessor :title, :trains

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
  
  def trains_by_type(type)
    self.trains.select{ |train| train.type if train.type == type }.count
  end
   
  def show_types
    self.trains.select{|tr| tr == "cargo"}.count("cargo")
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
  attr_reader :type, :number, :number_wagons
  
  def initialize (number, type, number_wagons)
    @number = number
    @type = type
    @number_wagons = number_wagons
    @speed = 0
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