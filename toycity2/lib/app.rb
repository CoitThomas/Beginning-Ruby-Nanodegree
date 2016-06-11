require 'json'

# Get path to products.json, read the file into a string,
# and transform the string into a usable hash
def setup_files
  path = File.join(File.dirname(__FILE__), '../data/products.json')
  file = File.read(path)
  $products_hash = JSON.parse(file)
  $report_file = File.new("../report.txt", "w+")
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

def products_data
  $products_hash["items"].each do |toy|
    toy_data = calculate_product_data(toy)
    print_product_data(toy_data)
  end
end

def calculate_product_data(toy)
  toy_data = {}

  # Get the name of the toy
  toy_data['name'] = toy["title"]
  # Get the retail price of the toy
  toy_data['retail price'] = toy["full-price"]
  # Calculate the total number of purchases
  toy_data['purchases'] = toy["purchases"].length
  # Calculate the total amount of sales
  toy_data['sales revenue'] = 
    toy["purchases"].inject(0) { |sales_total, sale| sales_total + sale["price"] }
  # Calculate the average price the toy sold for
  toy_data['average price'] = toy_data['sales revenue']/toy_data['purchases']
  # Calculate the average discount (% or $) based off the average sales price
  toy_data['average discount'] = 
    ((1 - toy_data['average price'].to_f / toy_data['retail price'].to_f) * 100).round(2)

  toy_data
end

def print_product_data(toy_data)
  # Print the name of the toy
  print_with_borders(toy_data['name'])
  # Print the retail price of the toy
  $report_file.write("Retail Price: $#{toy_data['retail price']}\n")
  # Print the total number of purchases
  $report_file.write("Purchases: #{toy_data['purchases']}\n")
  # Print the total amount of sales
  $report_file.write("Sales Revenue: $#{toy_data['sales revenue']}\n")
  # Print the average price the toy sold for
  $report_file.write("Average Price: $#{toy_data['average price']}\n")
  # Print the average discount (% or $) based off the average sales price
  $report_file.write("Average Discount: #{toy_data['average discount']}%\n")
  $report_file.write("\n")
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

def brands_data
  brand_names = $products_hash["items"].map { |item| item["brand"] }.uniq
  brand_names.each do |brand_name|
    brand_data = calculate_brand_data(brand_name)
	print_brand_data(brand_data)
  end
end

def calculate_brand_data(brand_name)
  brand_calculations = {}

  brand_info = $products_hash["items"].select { |item| item["brand"] == brand_name }

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

  brand_calculations['name'] = brand_name
  brand_calculations['toy count'] = toy_count
  brand_calculations['average toy price'] = (total_item_cost/brand_info.length).round(2)
  brand_calculations['total revenue'] = total_revenue.round(2)
  
  brand_calculations
end

def print_brand_data(brand_data)
  # Print the name of the brand
  print_with_borders(brand_data['name'])
  # Print the number of the brand's toys we stock
  $report_file.write("Toys in Stock: #{brand_data['toy count']}\n")
  # Print the average price of the brand's toys
  $report_file.write("Average toy price: $#{brand_data['average toy price']}\n")
  # Print the total sales volume of all the brand's toys combined.
  $report_file.write("Total revenue: $#{brand_data['total revenue']}\n")
  $report_file.write("\n")
end

def close_file
  $report_file.close
end

def start
  setup_files
  print_sales_header
  print_date
  print_products_header
  products_data
  print_brands_header
  brands_data
  close_file
end
	
start