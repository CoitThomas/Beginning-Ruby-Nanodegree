require_relative 'todolist.rb'

# Creates a new todo list
to_do_list = ToDoList.new("Coit's To Do List")

# Add four new items
to_do_list.add_item("Organize Closet", Time.new(2016,7,1))
to_do_list.add_item("Replace Light Bulbs", Time.new(2016,6,26))
to_do_list.add_item("Buy a New Couch", Time.new(2016,7,3))
to_do_list.add_item("Fix Leaky Faucet", Time.new(2016,6,26))

# Print the list
to_do_list.print

# Delete the first item
to_do_list.delete_item(1)

# Print the list
to_do_list.print

# Delete the second item
to_do_list.delete_item(2)

# Print the list
to_do_list.print

# Update the completion status of the first item to complete
to_do_list.complete_item(1)

# Print the list
to_do_list.print

# Update the title of the list
to_do_list.change_list_title("Hyewon's To Do List")

# Print the list
to_do_list.print
