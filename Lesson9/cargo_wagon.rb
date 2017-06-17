require_relative 'module_producer'
# class CawgoWagon
class CargoWagon
  include Producer

  attr_reader :type, :volume

  def initialize(volume)
    @type = :cargo
    @volume = volume
    @busy_volume = 0
  end

  def volume_take(x)
    @busy_volume += x
  end

  def volume_free
    @volume - @busy_volume
  end

  def volume_busy
    @busy_volume
  end
end
