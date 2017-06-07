require_relative 'moduleproducer'

class PassengerWagon
  module Producer
  attr_reader :type
    def initialize
      @type = :passenger
    end
  end
end
