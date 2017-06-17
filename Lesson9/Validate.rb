module Validate
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :types
    def validate(name, type, *args)
      @types ||= []
      @types << { name: name, type: type, args: args }
    end
  end

  module InstanceMethods
    def validate!
      self.class.types.each do |variable|
        value = instance_variable_get("@#{variable[:name]}")
        type =  "#{variable[:type]}"
        options = "#{variable[:args]}"
        send type, "value", "options"
      end
    end

    def presence(name, check_presence)
      raise "Presence Error" if name == 'speed'
    end

    def format(name, format, range)
      raise "Format error" unless format.match(range)
    end

    def type (name, class_type)
      raise "Class Error" unless name.instance_of?(class_type)
    end
  end
end

class Test
  include Validate

  attr_accessor :speed

  tr1 = Test.new
  end
