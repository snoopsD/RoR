module Validate
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :types
    def validate(name, type_method, *args)
      @types ||= []
      @types << { name: name, type_method: type_method, args: args }
    end
  end

  module InstanceMethods
    def validate!
      self.class.types.each do |variable|
        value = instance_variable_get("@#{variable[:name]}")
        options = "#{variable[:args]}"
        send variable[:type_method], variable[:name], value, options
      end
    end

    def valid?
      validate!
     raise
      false
    end

    def presence(name, check_presence, *args)
      raise "Presence Error" if check_presence.nil? || check_presence.to_s.empty?
    end

    def format(name, format, range)
      raise "Format error" unless range.to_s.match(range)
    end

    def type (name, type,type_class) 
      raise "Class Error" unless kind_of?(type_class)
    end
  end
end
