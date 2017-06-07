require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
require_relative 'moduleproducer'
require_relative 'validation'

class Main
  include Valid
  attr_reader :stations, :routes, :trains

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def actions
    puts "1. Создать станцию"
    puts "2. Создать поезд"
    puts "3. Создать маршрут"
    puts "4. Редактирование маршрута"
    puts "5. Выбрать маршрут для поезда"
    puts "6. Добавить вагон"
    puts "7. Отцепить вагон"
    puts "8. Переместить поезд по маршруту"
    puts "9. Список станций и поездов на них"
    puts "0. Выход"
  end

  def exec_actions(choose)
    case choose
    when 0
      exit
    when 1
      station_create
    when 2
      train_create
    when 3
      route_create
    when 4
      route_edit
    when 5
      route_set_train
    when 6
      add_wagon
    when 7
      remove_wagon
    when 8
      train_move
    when 9
      list_stations_trains
    end
  end

private
# Данные методы осуществляются только в этом классе. У него нет подклассов.

  def station_create
    print "Введите имя станции: "
    station_name = gets.chomp
    if station_name == ""
      puts "Имя станции не может быть пустым"
    else
      stations << Station.new(station_name)
    end
  end

  def train_create
    print "Введите номер поезда: "
    train_number = gets.chomp
    puts "Введите тип поезда: "
    puts "1. Пассажирский"
    puts "2. Грузовой"
    type_train = gets.chomp.to_i
    if type_train == 1
      trains << PassengerTrain.new(train_number)
    elsif  type_train == 2
      trains << CargoTrain.new(train_number)
    end
  end

  def route_create
    system 'cls'
    puts "Выберите начальную станцию: "
    stations.each_with_index do |station, id|
        puts "#{id}: #{station.name}"
      end
    first_station = stations[gets.chomp.to_i]
    puts "Выберите конечную станцию: "
    current = stations.select{ |station| station != first_station}
    current.each_with_index do |station, id|
        puts "#{id}: #{station.name}"
      end
    last_station = current[gets.chomp.to_i]
    routes << Route.new(first_station, last_station)
  end

  def route_edit
    system 'cls'
    puts "Выберите маршрут для редактирования: "
    routes.each_with_index do |route, id|
      puts "#{id}: #{route.stations.first.name} - #{route.stations.last.name}"
      end
    @edit_route = gets.chomp.to_i
    puts "#{routes[@edit_route].stations.first.name} - #{routes[@edit_route].stations.last.name}"
    puts "1. Добавить промежуточную станцию"
    puts "2. Удалить промежуточную станцию"
    route_choose = gets.chomp.to_i
    if route_choose == 1
      route_edit_station_number
    elsif route_choose == 2
      route_edit_station_number
    else
      puts "Неверный выбор"
    end
  end

  def route_set_train
    puts "Выберите поезд для назначения маршрута"
    trains.each_with_index do |train, id|
        puts "#{id}: #{train.number}-#{train.type}"
      end
    train_choose = trains[gets.chomp.to_i]
    puts "Выберите машрут: "
    routes.each_with_index do |route, id|
        puts "#{id}: #{route.stations.first.name} - #{route.stations.last.name}"
      end
    route_to_train = routes[gets.chomp.to_i]
    route_to_train.stations.first.add_train(train_choose)
    train_choose.route_add(route_to_train)
  end

  def add_wagon
    puts "Выберите поезд для добавления вагона"
    trains.each_with_index do |train, id|
        puts "#{id}: #{train.number}-#{train.type}"
      end
    train_id = trains[gets.chomp.to_i]
    if train_id.type == :passenger
      train_id.wagon_add(PassengerWagon.new)
    elsif train_id.type == :cargo
      train_id.wagon_add(CargoWagon.new)
    end
    puts "Вагон добавлен"
  end

  def remove_wagon
    puts "Выберите поезд для отцепки вагона"
    trains.each_with_index do |train, id|
        puts "#{id}: #{train.number}-#{train.type}"
      end
    train_id_rem = trains[gets.chomp.to_i]
    train_id_rem.wagon_remove
  end

  def train_move
    puts "Перемещение поезда по маршруту"
    puts "Выберите поезд: "
    trains.each_with_index do |train, id|
        puts "#{id}: #{train.number}-#{train.type}"
      end
    train_id_move = trains[gets.chomp.to_i]
    puts "Поезд находится на станции: "
    puts train_id_move.current_station.name
    puts "Куда переместить поезд?"
    puts "1. Вперед 2. Назад"
    choice_move = gets.chomp.to_i
    cur_station = train_id_move.current_station
    cur_station.remove(train_id_move)
    if choice_move == 1
      shift_station = train_id_move.move_next
    elsif choice_move == 2
      shift_station = train_id_move.move_back
    else puts "Поезд остался на текущей станции"
    end
    shift_station.add_train(train_id_move)
  end

  def list_stations_trains
    puts "Выберите станцию: "
    stations.each_with_index do |station, id|
        puts "#{id}: #{station.name}"
      end
    choice_st = stations[gets.chomp.to_i]
    puts "Выбрана станция #{choice_st.name}"
    puts "Поезда находящиеся на этой станции: "
    choice_st.show_trains.each_with_index do |train, id|
        puts "#{id}: #{train.number}-#{train.type}"
      end
  end

  def route_edit_station_number
    puts "Введите номер станции: "
    stations.each_with_index do |station, id|
        puts "#{id}: #{station.name}"
      end
    station_choose = gets.chomp.to_i
    routes[@edit_route].inter_point(stations[station_choose])
  end
end

start = Main.new
loop do
  start.actions
  userchoice = gets.chomp.to_i
  start.exec_actions(userchoice)
end
