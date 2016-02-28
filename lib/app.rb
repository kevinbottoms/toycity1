require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
date = Time.now.strftime("%d/%m/%y %H:%M")
puts "Date and time report generated: " + date

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
  # Print the name of the toy
  # Print the retail price of the toy
  # Calculate and print the total number of purchases
  # Calculate and print the total amount of sales
  # Calculate and print the average price the toy sold for
  # Calculate and print the average discount (% or $) based off the average sales price

retail_price = 0.0

products_hash["items"].each do |elements|
	elements.each do |key, value|
	  if key == "title"
		  puts value
		end # end if reading title
		if key == "full-price"
			retail_price = value
			puts "Retail Price: #{retail_price}"
		end # end if reading retail price
		if key == "purchases"
			units_sold = value.length
			puts "Units Sold: #{units_sold}"
			total_sales = 0.0
			value.each do |sales|
				sales.each do |key, value|
					if key  == "price"
						total_sales += value
					end # end if calculating total sales
				end # end each iterating purchases hash
			end # end each iterating purchases array
			puts "Sales Generated: #{total_sales}"
			average_price = total_sales.to_f / units_sold.to_f
			puts "Average Price per Unit: #{average_price}"
			average_discount = 100 - (average_price.to_f / retail_price.to_f * 100)
			puts "The average discount is #{'%.2f' % average_discount}%\n\n"
		end # end if gathering purchase data from hash
	end # end each iterating items hash
end # end each iterating items array


	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
  # Print the name of the brand
  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  # Calculate and print the total revenue of all the brand's toy sales combined
lego_carried = 0
lego_sales = []
lego_units_sold = 0
lego_average_price = 0.0
lego_total_revenue = 0.0
nano_carried = 0
nano_sales = []
nano_units_sold = 0
nano_average_price = 0.0
nano_total_revenue = 0.0


products_hash["items"].each do |elements|
	elements.each do |key, value|
		if value == "LEGO"
	    lego_carried += 1
			lego_sales.push elements
		end # end if incrementing LEGO units carried and push to LEGO array
		if value == "Nano Blocks"
			nano_carried += 1
			nano_sales.push elements
		end # end if incrementing Nano units carried and push to Nano array
	end # end each iterating items hash
end # end each iterating items array

lego_sales.each do |elements|
  elements.each do |key, value|
		if key == "purchases"
      lego_units_sold += value.length
			value.each do |sales|
				sales.each do |key, value|
					if key == "price"
						lego_total_revenue += value
					end # end if calculating total revenue
				end # end each iterating purchases hash
			end # end each iterating purchases array
		end # end if locating purchases key
	end # end if iterating lego hash
end # end if iterating lego array

lego_average_price = lego_total_revenue / lego_units_sold

nano_sales.each do |elements|
  elements.each do |key, value|
		if key == "purchases"
      nano_units_sold += value.length
			value.each do |sales|
				sales.each do |key, value|
					if key == "price"
						nano_total_revenue += value
					end # end if calculating total revenue
				end # end each iterating purchases hash
			end # end each iterating purchases array
		end # end if locating purchases key
	end # end if iterating nano hash
end # # end if iterating lego array

nano_average_price = nano_total_revenue / nano_units_sold

puts "LEGO"
puts "LEGO Toys Stocked: #{lego_carried}"
puts "LEGO Average Price: #{'%.2f' % lego_average_price}"
puts "LEGO Total Revenue: #{'%.2f' % lego_total_revenue}"
puts
puts "Nano Blocks"
puts "Nano Blocks Toys Stocked: #{nano_carried}"
puts "Nano Blocks Average Price: #{'%.2f' % lego_average_price}"
puts "Nano Blocks Total Revenue: #{'%.2f' % lego_total_revenue}"
