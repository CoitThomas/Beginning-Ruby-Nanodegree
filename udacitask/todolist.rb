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
  
  # Sort the Items in the ToDoList by their due_date.
  def sort_by_date
    dates = Array.new
	@items.each do |item|
	  dates.push(item.due_date)
	end
	sorted_dates = dates.sort
	sorted_items = Array.new
	sorted_dates.each do |sorted_date|
	  @items.each do |item|
	    if item.due_date == sorted_date
		  sorted_items.push(item)
		  @items.delete(item)
		end
	  end
	end
	@items = sorted_items
  end

  # Change the title of the ToDoList
  def change_list_title(new_list_title)
    @title = new_list_title.upcase
  end

  # Print the title with a border
  def print_title
    display_width = 79
    puts "=" * display_width
	puts ("#{@title}:").center(display_width)
	puts "=" * display_width
  end
  
  # Print the titles of each column.
  def print_column_headers
    display_width = 79
	column1 = "No."
	column2 = "Description"
	column3 = "Due"
	column4 = "Completed"
	printf "%s %-49s %-15s %s\n", column1, column2, column3, column4
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
  
  # Write the title with a border to a file.
  def write_title(file_object)
    display_width = 79
    file_object.puts "=" * display_width
	file_object.puts ("#{@title}:").center(display_width)
	file_object.puts "=" * display_width
  end
  
  # Write the titles of each column to a file.
  def write_column_headers(file_object)
    display_width = 79
	column1 = "No."
	column2 = "Description"
	column3 = "Due"
	column4 = "Completed"
	file_object.printf "%s %-49s %-15s %s\n", column1, column2, column3, column4
	file_object.puts "-" * display_width
  end

  # Format a filename in lower snakecase.
  def format_filename(filename)
    filename.gsub(/\s/, '_').gsub(/\W/, '').downcase 
  end
  
  # Write all current Items in the ToDoList to a file.
  def write_to_file
    column1 = "No."
	column2 = "Description"
	column3 = "Due"
	column4 = "Completed"

	new_file = File.open("#{format_filename(@title)}.txt", "w")

	write_title(new_file)
	write_column_headers(new_file)

	count = 0
    @items.each do |item|
      count += 1
      item.write(count, new_file)
    end

	new_file.close
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

  # Check the box to indicate completed if complete.
  def complete?
    if completion_status then "( X )" else "(   )" end
  end
  
  # Change the completion_status of an Item to true.  
  def mark_complete
    @completion_status = true
  end
  
  # Format a date: mm/dd/yyyy
  def format_date(date)
    year = date.year
	month = date.month
	day = date.day
	"#{month}/#{day}/#{year}"
  end

  # Print out an Item as a row. 
  def print(count)
    printf "%2s%s %-49s %-17s %s\n", count,
	                                 ".",
									 description,
									 format_date(due_date),
									 complete?
  end
  
  # Write out an Item as a row to a file.
  def write(count, file_object)
    file_object.printf "%2s%s %-49s %-17s %s\n", count,
	                                             ".",
									             description,
									             format_date(due_date),
									             complete?
  end
end