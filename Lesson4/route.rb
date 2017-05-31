#класс Route
class Route
  attr_accessor :stations

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
