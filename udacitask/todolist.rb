class ToDoList
  attr_reader :title, :items
  
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
  
  # Removes an Item at a given position from the ToDoList.
  def delete_item(item_position)
	item_position -= 1
	@items.delete_at(item_position)
  end

  # Marks an Item at a given position as "completed" in the ToDoList.
  def complete_item(item_position)
    item_position -= 1
    @items[item_position].mark_complete
  end

  def change_list_title(new_list_title)
    @title = new_list_title
  end

  # Prints the title with a border
  def print_title
    display_width = 56
    puts "=" * display_width
	puts ("#{@title}:").center(display_width)
	puts "=" * display_width
  end
  
  # Prints all the current Items in the ToDoList.
  def print
    print_title
	count = 0
    @items.each do |item|
      count += 1
    printf "%s. %-35s Completed?: %s\n", count, item.description, item.completion_status
    end
	puts
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

  # Changes the completion_status of an Item to true.  
  def mark_complete
    @completion_status = true
  end
end
