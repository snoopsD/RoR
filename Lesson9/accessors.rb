module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*args)
      args.each do |name|
        var_name = "@#{name}".to_sym
        define_method(name){ instance_variable_get(var_name) }
        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          @history_buffer ||= {}
          @history_buffer[name] ||= []
          @history_buffer[name] << value
        end
        define_method("#{name}_history") {@history_buffer[name]}
      end
    end
  end

    def strong_attr_accessor(name, class_name)
      var_name = "@#{name}".to_sym
      define_method(name){ instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        raise TypeError unless class_name.kind_of?(value)
        instance_variable_set(var_name, value)
      end
    end
end
