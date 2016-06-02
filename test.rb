
puts "Hello Everyone! Welcome to the name analyzer"
puts "Please enter your first name"
first_name = gets.chomp
puts "Please enter your last name"
last_name = gets.chomp
puts "Welcome #{first_name} #{last_name}!"
puts "There are #{first_name.length} characters in your first name"
puts "There is also #{last_name.length} characters in your last name"
puts "The reverse of your name is #{last_name.reverse} #{first_name.reverse}"
puts "Please enter your first number"
first_number = gets.chomp
puts "Please enter your second number"
second_number = gets.chomp
puts "The product is: #{first_number.to_i * second_number.to_i}"
puts "Please enter your first number"
first_number = gets.chomp
puts "Please enter your second number"
second_number = gets.chomp
puts "The dividend is: #{first_number.to_i / second_number.to_i.to_f}"
puts "Please enter your first number"
first_number = gets.chomp
puts "Please enter your second number"
second_number = gets.chomp
puts "The mod is: #{first_number.to_i % second_number.to_i}"