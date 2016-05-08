require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
puts
date = Time.new
puts "Today's Date: #{date.month}/#{date.day}/#{date.year}"

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "
puts

# For each product in the data set:
products_hash["items"].each do |toy|

  # Print the name of the toy
  toy["title"].length.times {print "="}
  puts
  puts toy["title"]
  toy["title"].length.times {print "="}
  puts

  # Print the retail price of the toy
  retail_price = toy["full-price"]
  puts "Retail Price: $#{retail_price}"

  # Calculate and print the total number of purchases
  purchases = toy["purchases"].length
  puts "Purchases: #{purchases}"

  # Calculate and print the total amount of sales
  sales_total = 0
  toy["purchases"].each do |purchase|
    sales_total = sales_total + purchase["price"]
  end
  puts "Total Sales: $#{sales_total}"

  # Calculate and print the average price the toy sold for
  avg_price = sales_total/purchases
  puts "Average Price: $#{avg_price}"

  # Calculate and print the average discount (% or $) based off the average sales price
  avg_discount = ((1 - avg_price.to_f / retail_price.to_f) * 100).round(2)
  puts "Average Discount: #{avg_discount}%"
  puts
end

	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# Create an array of brands, excluding repeats.
brands = Array.new
products_hash["items"].each { |toy| brands.push(toy["brand"]) }
brands.uniq!

# For each brand in the data set:
brands.each do |brand|

  # Print the name of the brand
  brand.length.times {print "="}
  puts
  puts brand
  brand.length.times {print "="}
  puts

  # Count and print the number of the brand's toys we stock
  toy_count = 0
  products_hash["items"].each do |toy|
    if toy["brand"] == brand
      toy_count = toy_count + toy["stock"]
    end
  end
  puts "Toys in Stock: #{toy_count}"

  # Calculate and print the average price of the brand's toys
  num_of_items = 0
  total_item_cost = 0.00
  products_hash["items"].each do |toy|
    if toy["brand"] == brand
      num_of_items = num_of_items + 1
	  total_item_cost = total_item_cost + toy["full-price"].to_f
    end
  end
  puts "Average Price of a Toy: $#{(total_item_cost/num_of_items).round(2)}"

  # Calculate and print the total revenue of all the brand's toy sales combined
  total_revenue = 0
  products_hash["items"].each do |toy|
    if toy["brand"] == brand
      toy["purchases"].each do |purchase|
        total_revenue = total_revenue + purchase["price"]
      end
    end
  end
  puts "Total Revenue: $#{total_revenue.round(2)}"
  puts
end
