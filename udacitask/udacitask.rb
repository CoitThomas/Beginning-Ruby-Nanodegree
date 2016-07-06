require_relative 'todolist.rb'

# Creates a new todo list
to_do_list = ToDoList.new("Coit's To Do List")

# Add four new items
to_do_list.add_item("Organize the closet", Time.new(2016,7,1))
to_do_list.add_item("Replace the light bulbs in the kitchen", Time.new(2016,6,26))
to_do_list.add_item("Buy a new couch", Time.new(2016,7,3))
to_do_list.add_item("Fix the leaky faucet in the bathroom", Time.new(2016,6,26))

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

# Add eight new items
to_do_list.add_item("Watch another FoodWishes.com video", Time.new(2016,6,28))
to_do_list.add_item("Scold those who voted in favor of Brexit", Time.new(2016,7,27))
to_do_list.add_item("Read 'Ready Player One'", Time.new(2016,7,5))
to_do_list.add_item("Sculpt a sculptor sculpting a sculpture", Time.new(2016,6,30))
to_do_list.add_item("Drop it like it's hot", Time.new(2016,6,28))
to_do_list.add_item("Solve world hunger", Time.new(2016,7,27))
to_do_list.add_item("Find the leprechaun's pot of gold", Time.new(2016,7,5))
to_do_list.add_item("Dance on Ramsay Snow's grave", Time.new(2016,6,30))

# Print the list
to_do_list.print

# Sort the list by due date
to_do_list.sort_by_date

# Print the list
to_do_list.print

to_do_list.write_to_file
