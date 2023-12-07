module Logging
  def log(message)
    puts "Запис: #{message}"
  end
end

class MyClass
  include Logging
end

class AnotherClass
  include Logging
end

obj1 = MyClass.new
obj1.log("Це повідомлення з MyClass")

obj2 = AnotherClass.new
obj2.log("Це повідомлення з AnotherClass")
puts "\n"
module MathOperations
  def self.add(x, y)
    x + y
  end
end

result = MathOperations.add(3, 4)
puts "Результат додавання: #{result}"
puts "\n"

module AdditionalFunctionality
  def additional_method
    puts "Це додатковий метод"
  end
end

class MyClass
  include AdditionalFunctionality
end

obj = MyClass.new
obj.additional_method
puts "\n"

module A
  def method_A
    puts "Метод A"
  end
end

module B
  def method_B
    puts "Метод B"
  end
end

class MyClass
  include A
  include B
end

obj = MyClass.new
obj.method_A
obj.method_B
puts "\n"

module MetaModule
  def meta_method
    puts "Це мета-метод"
  end
end

obj = Object.new
obj.extend(MetaModule)
obj.meta_method
puts "\n"