#класс Station
class Station
  attr_reader :trains, :name

  def initialize( name )
    @name = name
    @trains = []
  end

  def add_train( train )
    @trains << train
    puts "Поезд #{ train } прибыл на станцию"
  end

  def show_trains
    puts "На станции #{ @trains }"
  end

  def show_types(type)
    self.trains.select{ |train| train.type if train.type == type }.count
  end

  def remove(train)
    @trains.delete(train)
    puts "Поезд #{train} покинул станцию"
  end
end

#класс Route
class Route
  attr_accessor :stations, :name


  def initialize(start_station, end_station)
    @stations = []
    @stations << start_station << end_station
  end

  def inter_point(inter_station)
    @stations.insert(-2, inter_station)
    puts "Промежуточная станция добавлена"
  end

  def del_inter_point(inter_station)
    @stations.delete(inter_station)
    puts "Промежуточная станция удалена"
  end

 def print_stations
    puts "#{@stations}"
 end

end

#класс Train
class Train
  attr_accessor :speed, :route
  attr_reader :type, :number, :number_wagons

  def initialize (number, type, number_wagons)
    @number = number
    @type = type
    @number_wagons = number_wagons
    @speed = 0
    @route = nil
    @current_station = nil
  end

  def up_speed(speed)
    @speed  += speed
    puts "Скорость стала равной: #{speed}"
  end

  def current_speed
    puts "Текущая скорость: #{speed}"
  end

  def stop
    @speed = 0
    puts "Поезд остановился"
  end

  def return_number_wagons
    puts "Кол-во вагонов: #{@number_wagons}"
  end

  def wagon_add
    if @speed !=0
      puts "Для сцепки вагонов необходимо остановиться!"
    elsif
      puts "Добавлен один вагон. Всего вагонов: #{ @number_wagons +=1 }"
    end
  end

  def wagon_remove
    if @speed != 0
      puts "Для отцепки вагонов необходимо остановиться!"
    elsif @number_wagons == 0
      puts "Отцеплять ничего.Нет ни одного вагона."
    else
      puts "Вагон отцеплен. Всего вагонов #{ @number_wagons -=1 }"
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
      @current_station = self.route.stations.index(@current_station)+1
      @current_station = self.route.stations[@current_station]
    end
  end

  def move_back
    if @current_station == self.route.stations[0]
      puts "Это начальная станция. Назад двигаться нельзя!"
    else
      @current_station = self.route.stations.index(@current_station)-1
      @current_station = self.route.stations[@current_station]
    end
  end




end
