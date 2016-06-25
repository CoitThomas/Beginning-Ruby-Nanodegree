class ToDoList
  attr_reader :title, :items
  
  # Initialize todo list with a title and no items
  def initialize(list_title)
    @title = list_title.upcase
	@items = Array.new
  end
  
  # Creates a new Item and adds it to the array of Items
  def add_item(description, due_date)
    item = Item.new(description, due_date)
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
    @title = new_list_title.upcase
  end

  # Prints the title with a border
  def print_title
    display_width = 60
    puts "=" * display_width
	puts ("#{@title}:").center(display_width)
	puts "=" * display_width
  end
  
  def print_column_headers
    display_width = 60
	column1 = "No."
	column2 = "Description"
	column3 = "Due"
	column4 = "Completed"
	printf "%s %-30s %-15s %s\n", column1, column2, column3, column4
	puts "-" * display_width
  end
  
  # Prints all the current Items in the ToDoList.
  def print
    print_title
	print_column_headers
	count = 0
    @items.each do |item|
      count += 1
      item.print(count)
    end
	puts
  end
end

class Item
  attr_reader :description, :completion_status, :due_date

  # Initialize item with a description and marked as
  # not complete  
  def initialize(item_description, due_date)
    @description = item_description
	@due_date = due_date
    @completion_status = false
  end

  def complete?
    if completion_status then "( X )" else "(   )" end
  end
  
  # Changes the completion_status of an Item to true.  
  def mark_complete
    @completion_status = true
  end
  
  def format_date(date)
    year = date.year
	month = date.month
	day = date.day
	"#{month}/#{day}/#{year}"
  end
    
  def print(count)
    printf "%2s%s %-30s %-19s %s\n", count, ".", description, format_date(due_date), complete?
  end
end