class DynamicMethods
  def method_missing(method_name, *args, &block)
    if method_name.to_s.start_with?("dynamic_")
      real_method_name = method_name.to_s.sub("dynamic_", "")
      
      self.class.send(:define_method, method_name) do |*args, &block|
        puts "Calling dynamic method #{real_method_name} with arguments #{args}"
      end
      
      send(method_name, *args, &block)
    else
      super
    end
  end
end

obj = DynamicMethods.new
obj.dynamic_hello("world")