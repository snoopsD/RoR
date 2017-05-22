#класс Station
class Station
  attr_accessor :train, :type_trains

  def initialize(sn)
    @station_name = sn
    @train = train
    @list_trains = train
    @type_trains = type_trains
  end

  def get_train(train)
    puts "Поезд #{train} прибыл на станцию"
  end

  def get_train_lists
    puts "На станции #{@list_trains} поездов"
  end

  def get_types_trains
    puts "На станции поезда таких типов: #{type_trains}"
  end

  def out_of_trains(train)
    puts "Поезд #{train} уехал со станции"
  end
end

#класс Route
class Route
  attr_accessor :a_point, :b_point, :z_point

  def initialize(a_point, z_point)
    @a_point = a_point
    @z_point = z_point
  end

  def inter_point(b_point)
    puts "Промежуточная станция добавлена"
  end

  def del_inter_point(b_point)
    puts "Промежуточная станция удалена"
  end

 def print_stations
    puts "Список всех станций"
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
