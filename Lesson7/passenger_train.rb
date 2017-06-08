class PassengerTrain < Train
attr_accessor :seats

  def initialize(number)
    @type = :passenger
    super
  end

end
