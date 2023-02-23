# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end




# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    #raise typeerror is not todo item
    begin
      raise TypeError if todo.class != Todo
      self.todos << todo
      puts "The list item '#{todo.title}' was added."
    rescue TypeError => e
      puts "#{e.class}: The list item was not added. The list item must be an instance of the Todo class."
    end
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos
  end

  def done?
    todos.all? { |item| item.done == true }
  end

  def done!
    todos.each { |item| item.done!}
  end

  def item_at(index)
    begin
      value = todos.fetch(index)
      raise IndexError if !value
      value
    rescue IndexError => e
      puts "#{e.class}: Item does not exist."
    end
  end

  def remove_at(index)
    begin
      value = todos.fetch(index)
      raise IndexError if !value
      todos.delete_at(index)
    rescue IndexError => e
      puts "#{e.class}: Item does not exist."
    end
  end

  def mark_done_at(index)
    begin
      value = todos.fetch(index)
      raise IndexError if !value
      todos[index].done!
      puts "#{todos[index]} marked done."
    rescue IndexError => e
      puts "#{e.class}: Item does not exist."
    end
  end

  def mark_undone_at(index)
    begin
      value = todos.fetch(index)
      raise IndexError if !value
      todos[index].undone!
      puts "#{todos[index]} marked undone."
    rescue IndexError => e
      puts "#{e.class}: Item does not exist."
    end
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def to_s
    puts "# ---- Today's Todos ----"
    todos.each do |item|
      puts item
    end

  end



end


# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----


# size
p list.size                       # returns 3

# first
p list.first                      # returns todo1, which is the first item in the list

# last
p list.last                       # returns todo3, which is the last item in the list

#to_a
p list.to_a                      # returns an array of all items in the list

#done?
p list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
#p list.item_at                    # raises ArgumentError
p list.item_at(1)                 # returns 2nd item in list (zero based index)
p list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
#list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
list.mark_undone_at(100)        # raises IndexError

# done!
list.done!                      # marks all items as done
puts list
# ---- Deleting from the list -----

# shift
#list.shift                      # removes and returns the first item in list
#puts list
# pop
#list.pop                        # removes and returns the last item in list
#puts list
# remove_at
# list.remove_at                  # raises ArgumentError
list.remove_at(1)               # removes and returns the 2nd item
puts list
list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym