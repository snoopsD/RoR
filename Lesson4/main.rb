require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

stations = []
trains = []
routes = []

loop do

puts "Список команд: "
puts "1. Создать станцию"
puts "2. Создать поезд"
puts "3. Создать маршрут"
puts "4. Редактировать маршрут"
puts "5. Назначить маршрут поезду"
puts "6. Добавить вагон к поезду"
puts "7. Отцепить вагон от поезда"
puts "8. Переместить поезд по маршруту"
puts "9. Посмотреть список станций и список поездов на них"
puts "0. Выход"
choose = gets.chomp.to_i

case choose

when 0
  break

when 1
  print "Введите имя станции: "
  station_name = gets.chomp
  stations << Station.new(station_name)

when 2
  print "Введите номер поезда: "
  train_number = gets.chomp.to_i
  puts "Введите тип поезда: "
  puts "1. Пассажирский"
  puts "2. Грузовой"
  type_train = gets.chomp.to_i

  if type_train == 1
    trains << Train.new(PassengerTrain.new(train_number))
  elsif  type_train == 2
    trains << Train.new(CargoTrain.new(train_number))
  end

when 3
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


when 4
  system 'cls'
  puts "Выберите маршрут для редактирования: "
  routes.each_with_index do |route, id|
  puts "#{id}: #{route.stations.first.name} - #{route.stations.last.name}"
  end
  edit_route = gets.chomp.to_i
  puts "#{routes[edit_route].stations.first.name} - #{routes[edit_route].stations.last.name}"
  puts "1. Добавить промежуточную станцию"
  puts "2. Удалить промежуточную станцию"
  route_choose = gets.chomp.to_i
  if route_choose == 1
    puts "Введите номер станции: "
    stations.each_with_index do |station, id|
    puts "#{id}: #{station.name}"
      end
    station_choose = gets.chomp.to_i
    routes[edit_route].inter_point(stations[station_choose])
  elsif route_choose == 2
    puts "Введите номер станции: "
    stations.each_with_index do |station, id|
    puts "#{id}: #{station.name}"
      end
    station_choose = gets.chomp.to_i
    routes[edit_route].del_inter_point(stations[station_choose])
  else
    puts "Неверный выбор"
  end

when 5
  puts "Выберите поезд для назначения маршрута"
  trains.each_with_index do |train, id|
    puts "#{id}: #{train.type.number} - #{train.type}"
    end
  train_choose = trains[gets.chomp.to_i]
  puts "Выберите машрут: "
  routes.each_with_index do |route, id|
    puts "#{id}: #{route.stations.first.name} - #{route.stations.last.name}"
    end
  route_to_train = routes[gets.chomp.to_i]
  route_to_train.stations.first.add_train(train_choose)
  train_choose.route_add(route_to_train)



when 6
  puts "Выберите поезд для добавления вагона"
  trains.each_with_index do |train, id|
    puts "#{id}: #{train.type.number} - #{train.type}"
  end
  train_id = trains[gets.chomp.to_i]
  if train_id.type.to_s.include?("PassengerTrain")
    train_id.wagon_add(PassengerWagon.new)
    puts "Вагон добавлен"
  elsif train_id.type.to_s.include?("CargoTrain")
    train_id.wagon_add(CargoWagon.new)
    puts "Вагон добавлен"
  end

when 7
  puts "Выберите поезд для отцепки вагона"
  trains.each_with_index do |train, id|
    puts "#{id}: #{train.type.number} - #{train.type}"
  end
  train_id_rem = trains[gets.chomp.to_i]
  train_id_rem.wagon_remove

when 8
  puts "Перемещение поезда по маршруту"
  puts "Выберите поезд: "
  trains.each_with_index do |train, id|
    puts "#{id}: #{train.type.number} - #{train.type}"
  end
  train_id_move = trains[gets.chomp.to_i]
  puts "Поезд находится на станции: "
  puts train_id_move.current_station.name
  puts "Куда переместить поезд?"
  puts "1. Вперед 2. Назад"
  choice_move = gets.chomp.to_i
  if choice_move == 1
    cur_station = train_id_move.current_station
    cur_station.remove(train_id_move)
    shift_station = train_id_move.move_next
    shift_station.add_train(train_id_move)

  elsif choice_move == 2
    cur_station = train_id_move.current_station
    cur_station.remove(train_id_move)
    shift_station = train_id_move.move_back
    shift_station.add_train(train_id_move)
  else puts "Поезд остался на текущей станции"
  end

when 9
  puts "Выберите станцию: "
  stations.each_with_index do |station, id|
    puts "#{id}: #{station.name}"
  end
choice_st = stations[gets.chomp.to_i]
puts "Выбрана станция #{choice_st.name}"
puts "Поезда находящиеся на этой станции: "
choice_st.show_trains.each_with_index do |train, id|
  puts "#{id}: #{train.type.number} - #{train.type}"
end

end
end
