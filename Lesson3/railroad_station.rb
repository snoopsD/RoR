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
  attr_accessor :b_point
  

  def initialize(a_point, z_point)
    @z_point = z_point
    @a_point = a_point
  end

  def add_inter_point(b_point)
    puts "Промежуточная станция добавлена"
  end

 def print_stations

 end

end

#класс Train
class Train

  def initialize(tn, tt, nw)
    @train_number = tn
    @type_train = tt
    @number_wagons = nw
  end
end
