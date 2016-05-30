require 'json'

# Get path to products.json, read the file into a string,
# and transform the string into a usable hash
def setup_files
  path = File.join(File.dirname(__FILE__), '../data/products.json')
  file = File.read(path)
  $products_hash = JSON.parse(file)
  $report_file = File.new("report.txt", "w+")
end

# Print "Sales Report" in ascii art
def print_sales_header
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
def print_date
  date = Time.new
  puts "Today's Date: #{date.month}/#{date.day}/#{date.year}"
  puts
end

# Print "Products" in ascii art
def print_products_header
  puts "                     _            _       "
  puts "                    | |          | |      "
  puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
  puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
  puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
  puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
  puts "| |                                       "
  puts "|_|                                       "
  puts
end

# For each product in the data set:
	# Print the name of the toy
	# Print the retail price of the toy
	# Calculate and print the total number of purchases
	# Calculate and print the total amount of sales
	# Calculate and print the average price the toy sold for
	# Calculate and print the average discount (% or $) based off the average sales price

# Print "Brands" in ascii art
def print_brands_header
  puts " _                         _     "
  puts "| |                       | |    "
  puts "| |__  _ __ __ _ _ __   __| |___ "
  puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
  puts "| |_) | | | (_| | | | | (_| \\__ \\"
  puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
  puts
end

# For each brand in the data set:
	# Print the name of the brand
	# Count and print the number of the brand's toys we stock
	# Calculate and print the average price of the brand's toys
	# Calculate and print the total sales volume of all the brand's toys combined

def start
  setup_files
  print_sales_header
  print_date
  print_products_header
  print_brands_header
end
	
start