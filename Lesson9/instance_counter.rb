module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instance
      @instances
    end

    def add_instance
      @instances ||= 0
      @instances += 1
    end
  end

  module InstanceMethods
    def register_instance
      self.class.add_instance
    end
  end
end
