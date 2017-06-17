require_relative 'module_producer'

class PassengerWagon
  include Producer

  attr_reader :type, :seats

  def initialize(seats)
    @type = :passenger
    @seats = seats
    @busy_seats = 0
  end

  def seat_take
    @busy_seats += 1
  end

  def free_seat
    @seats - @busy_seats
  end

  def busy
    @busy_seats
  end
end
