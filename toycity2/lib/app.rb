# Get path to products.json, read the file into a string,
# and transform the string into a usable hash
def setup_files
  path = File.join(File.dirname(__FILE__), '../data/products.json')
  file = File.read(path)
  $products_hash = JSON.parse(file)
  $report_file = File.new("report.txt", "w+")
end

# Print "Sales Report" in ascii art
def print_sales_report
  puts " _____       _            ______                      _"
  puts "/  ___|     | |           | ___ \\                    | |"
  puts "\\ `--.  __ _| | ___  ___  | |_/ /___ _ __   ___  _ __| |_"
  puts " `--. \\/ _` | |/ _ \\/ __| |    // _ \\ '_ \\ / _ \\| '__| __|"
  puts "/\\__/ / (_| | |  __/\\__ \\ | |\\ \\  __/ |_) | (_) | |  | |_"
  puts "\\____/ \\__,_|_|\\___||___/ \\_| \\_\\___| .__/ \\___/|_|   \\__|"
  puts "====================================| |==================="
  puts "                                    |_|"
end

# Print today's date

# Print "Products" in ascii art

# For each product in the data set:
	# Print the name of the toy
	# Print the retail price of the toy
	# Calculate and print the total number of purchases
	# Calculate and print the total amount of sales
	# Calculate and print the average price the toy sold for
	# Calculate and print the average discount (% or $) based off the average sales price

# Print "Brands" in ascii art

# For each brand in the data set:
	# Print the name of the brand
	# Count and print the number of the brand's toys we stock
	# Calculate and print the average price of the brand's toys
	# Calculate and print the total sales volume of all the brand's toys combined

print_sales_report