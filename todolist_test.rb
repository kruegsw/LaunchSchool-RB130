require 'minitest/autorun'
#require "minitest/reporters"
#Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false , @list.done?)
  end

  def test_add_raise_TypeError
    assert_raises(TypeError) do |_|
      @list.add(2)
    end
  end

  def test_shovel
    @list << @todo1
    assert_equal(@todo1 , @list.last)
  end

  def test_add_alias
    @todo4 = Todo.new("do pushups")
    todos_new1 = @todos << @todo4
    todos_new2 = @list.add @todo4
    assert_equal(todos_new1, todos_new2)

  end

  def test_item_at
    assert_equal(@todos[2], @list.item_at(2))
    assert_raises(IndexError) { |_| @list.item_at(4) }
  end

  def test_mark_done_at
    @list.mark_done_at(2)
    assert_equal(true, @todo3.done?)
    assert_raises(IndexError) { |_| @list.mark_done_at(4) }
  end

  def test_mark_undone_at
    @list.done!
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_raises(IndexError) { |_| @list.mark_undone_at(100) }
  end

  def test_to_s
    result1 = <<~RESULT.chomp
      ---- Today's Todos ----
      [ ] Buy milk
      [ ] Clean room
      [ ] Go to gym
    RESULT
    assert_equal(result1, @list.to_s)

    @list.mark_done_at(1)
    result2 = <<~RESULT.chomp
      ---- Today's Todos ----
      [ ] Buy milk
      [X] Clean room
      [ ] Go to gym
    RESULT
    assert_equal(result2, @list.to_s)

    @list.done!
    result3 = <<~RESULT.chomp
      ---- Today's Todos ----
      [X] Buy milk
      [X] Clean room
      [X] Go to gym
    RESULT
    assert_equal(result3, @list.to_s)


  end


end

