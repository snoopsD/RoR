module InstanceCounter
  def self.included(base)
    base.extend  ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def instances
      @instance
    end

    def add_instances
      @instance ||= 0
      @instance += 1      
    end
  end

  module InstanceMethods

    private

    def register_instance
      self.class.send :add_instances
    end
  end
end
