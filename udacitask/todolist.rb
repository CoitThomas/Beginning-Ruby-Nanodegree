class ToDoList
  attr_reader :title, :items
  attr_accessor :size

  # Initialize todo list with a title and no items
  def initialize(list_title)
    @title = list_title
	@items = Array.new
  end
  
  # Creates a new Item and adds it to the array of Items
  def add_item(new_item)
    item = Item.new(new_item)
    @items.push(item)
  end
  
  def print
    count = 0
    @items.each do |item|
      count += 1
    printf "%s. %-35s Completed?: %s\n", count, item.description, item.completion_status
    end
  end
end

class Item
  attr_reader :description, :completion_status

  # Initialize item with a description and marked as
  # not complete  
  def initialize(item_description)
    @description = item_description
    @completion_status = false
  end
end
