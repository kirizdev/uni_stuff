class Node
  attr_accessor :data, :next

  def initialize(data = nil)
    @data = data
    @next = nil
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def is_empty?
    @head.nil?
  end

  def insert_at_end(data)
    new_node = Node.new(data)
    if is_empty?
      @head = new_node
    else
      last = @head
      last = last.next while last.next
      last.next = new_node
    end
  end

  def delete_at_beginning
    return nil if is_empty?

    data = @head.data
    @head = @head.next
    data
  end

  def display
    current = @head
    while current
      print "#{current.data} -> "
      current = current.next
    end
    puts "nil"
  end
end

class Queue
  def initialize
    @linked_list = LinkedList.new
  end

  def enqueue(data)
    @linked_list.insert_at_end(data)
  end

  def dequeue
    @linked_list.delete_at_beginning
  end

  def front
    @linked_list.head&.data
  end

  def rear
    current = @linked_list.head
    current = current.next while current&.next
    current&.data
  end
  
  def display
    @linked_list.display
  end
end

queue = Queue.new

queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)

puts "Front: #{queue.front}"
puts "Rear: #{queue.rear}"

puts "Dequeue: #{queue.dequeue}"

puts "Front: #{queue.front}"
puts "Rear: #{queue.rear}"

queue.enqueue(20)

queue.display

