class DynamicMethods
  def self.create_method(method_name)
    define_method(method_name) do |*args, &block|
      puts "Calling dynamic method #{method_name} with arguments #{args}"
    end
  end
end

DynamicMethods.create_method("dynamic_hello")

obj = DynamicMethods.new
obj.dynamic_hello("world")