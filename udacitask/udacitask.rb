require_relative 'todolist.rb'

# Creates a new todo list
to_do_list = ToDoList.new("Coit's To Do List:")

# Add four new items
to_do_list.add_item("Organize Closet")
to_do_list.add_item("Replace Burnt Out Light Bulbs")
to_do_list.add_item("Buy a Couch")
to_do_list.add_item("Fix Leaky Faucet")

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

# Print the list

# Update the title of the list

# Print the list
