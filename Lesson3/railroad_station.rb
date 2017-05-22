#класс Station
class Station
  attr_accessor :trains, :type_trains

  def initialize(sn)
    @station_name = sn
    @trains = []
  end

  def add_train(trains)
    @trains << trains
    puts "Поезд #{trains} прибыл на станцию"
  end

  def show_trains
    puts "На станции #{@trains} поездов"
  end

  def show_types(type_trains)
    @trains.each.include?("#{type_trains}")

  end

  def remove_train(train)
    @trains.pop(train)
    puts "Поезд #{train} уехал со станции"
  end
end

#класс Route
class Route
  attr_accessor :start_st, :inter_st, :end_st, :stations

  def initialize(start_st, end_st)
    @stations = []
    @stations.push(start_st, end_st)
  end

  def inter_point(inter_st)
    @stations.insert(1, inter_st)
    puts "Промежуточная станция добавлена"
  end

  def del_inter_point(inter_st)
    @stations.delete_at(1)
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

  def initialize(tn, tt, nw)
    @train_number = tn
    @type_train = tt
    @number_wagons = nw
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
