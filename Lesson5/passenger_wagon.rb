require_relative 'module_producer'

class PassengerWagon
module Producer
attr_reader :type

  def initialize
    @type = :passenger
  end

end
