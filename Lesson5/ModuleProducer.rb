module Producer
  def set_name_producer(name)
    self.nameproducer = name
  end

  def get_name_producer
    nameproducer
  end

  protected
  attr_accessor :nameproducer
end
