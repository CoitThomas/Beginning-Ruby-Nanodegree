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
  $report_file.write(" _____       _            ______                      _\n")
  $report_file.write("/  ___|     | |           | ___ \\                    | |\n")
  $report_file.write("\\ `--.  __ _| | ___  ___  | |_/ /___ _ __   ___  _ __| |_\n")
  $report_file.write(" `--. \\/ _` | |/ _ \\/ __| |    // _ \\ '_ \\ / _ \\| '__| __|\n")
  $report_file.write("/\\__/ / (_| | |  __/\\__ \\ | |\\ \\  __/ |_) | (_) | |  | |_\n")
  $report_file.write("\\____/ \\__,_|_|\\___||___/ \\_| \\_\\___| .__/ \\___/|_|   \\__|\n")
  $report_file.write("====================================| |===================\n")
  $report_file.write("                                    |_|\n")
end

# Print today's date
def print_date
  date = Time.new
  $report_file.write("Today's Date: #{date.month}/#{date.day}/#{date.year}\n")
  $report_file.write("\n")
end

# Print "Products" in ascii art
def print_products_header
  $report_file.write("                     _            _\n")
  $report_file.write("                    | |          | |\n")
  $report_file.write(" _ __  _ __ ___   __| |_   _  ___| |_ ___\n")
  $report_file.write("| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|\n")
  $report_file.write("| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\\n")
  $report_file.write("| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/\n")
  $report_file.write("| |\n")
  $report_file.write("|_|\n")
  $report_file.write("\n")
end

def print_with_borders(text)
  $report_file.write("=" * text.length + "\n")
  $report_file.write(text + "\n")
  $report_file.write("=" * text.length + "\n")
end

def print_products_report
  # For each product in the data set:
  $products_hash["items"].each do |toy|
    # Print the name of the toy
	print_with_borders(toy["title"])
    
	# Print the retail price of the toy
	retail_price = toy["full-price"]
	$report_file.write("Retail Price: $#{retail_price}\n")
    
	# Calculate and print the total number of purchases
	purchases = toy["purchases"].length
	$report_file.write("Purchases: #{purchases}\n")

	# Calculate and print the total amount of sales
	sales_revenue = toy["purchases"].inject(0) { |sales_total, sale| sales_total + sale["price"] }
	$report_file.write("Sales Revenue: $#{sales_revenue}\n")
    
	# Calculate and print the average price the toy sold for
	avg_price = sales_revenue/purchases
	$report_file.write("Average Price: $#{avg_price}\n")
    
	# Calculate and print the average discount (% or $) based off the average sales price
	avg_discount = ((1 - avg_price.to_f / retail_price.to_f) * 100).round(2)
    $report_file.write("Average Discount: #{avg_discount}%\n")
    $report_file.write("\n")
  end
end

# Print "Brands" in ascii art
def print_brands_header
  $report_file.write(" _                         _\n")
  $report_file.write("| |                       | |\n")
  $report_file.write("| |__  _ __ __ _ _ __   __| |___\n")
  $report_file.write("| '_ \\| '__/ _` | '_ \\ / _` / __|\n")
  $report_file.write("| |_) | | | (_| | | | | (_| \\__ \\\n")
  $report_file.write("|_.__/|_|  \\__,_|_| |_|\\__,_|___/\n")
  $report_file.write("\n")
end

def print_brands_report
  brands = $products_hash["items"].map { |item| item["brand"] }.uniq
  # For each brand in the data set:
  brands.each do |brand|
    # Print the name of the brand
	print_with_borders(brand)
	
	brand_info = $products_hash["items"].select { |item| item["brand"] == brand }

    toy_count = 0
    total_item_cost = 0
    total_revenue = 0

    brand_info.each do |item|
      toy_count += item["stock"]
      total_item_cost += item["full-price"].to_f
	  item["purchases"].each do |sale|
	    total_revenue += sale["price"]
      end
	end

	# Count and print the number of the brand's toys we stock
	$report_file.write("Toys in Stock: #{toy_count}\n")
	# Calculate and print the average price of the brand's toys
	$report_file.write("Average toy price: $#{(total_item_cost/brand_info.length).round(2)}\n")
    # Calculate and print the total sales volume of all the brand's toys combined
	$report_file.write("Total revenue: $#{total_revenue.round(2)}\n")
	$report_file.write("\n")
  end
end

def start
  setup_files
  print_sales_header
  print_date
  print_products_header
  print_products_report
  print_brands_header
  print_brands_report
end
	
start