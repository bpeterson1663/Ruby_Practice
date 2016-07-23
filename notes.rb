=begin
  Ruby is case sensitive
  do not need to declare new variables
  do execute a program in command line, type ruby "file name"
=end

if 5 > 3 #evaluates whther true
  puts "true"
elsif 5< 3
   puts "false"
 else
  puts "I am here"
end
#unless can be used insted of if to evaluate wheter false
=begin
  This is a multiple line comment block
  Some methods that can be applied to strings
  .upcase
  .downcase
  .capitaize
  .length
  Remeber to use ! after the method to store the result back in the variable

  .include? method will check if a string is included and evaluate to false
  .gsub! will substitute a string of characters with another set


=end

string_name = "brady"
string_name.upcase!
string_name.include?("B") #true
puts string_name
string_name.gsub!(/Y/, "ly")
puts string_name
i = 20
  loop do
		i -= 1
    next if i % 2 == 1
		puts "#{i}"
		break if i <= 0
	end
=begin
  #will execute and perform code inside loop while break statement is false
	next keyword will skip over the statement
		example next if i % 2 == 1 #will skip over if i is odd
=end
numbers_odd = [1, 3, 5, 7, 9]

numbers_odd.each do |x|
  x *= 2
  puts x
end

30.times {puts "Brady"}

=begin
  hash's are key value pairs. Remeind me of objects. They act like arrays but instead of a number index we can call the index however we want
=end
my_hash = {
  "cake" => "chocolate",
  "pie" => "cherry",
  "cookie" => "snickerdoodle"
  }
puts my_hash["cake"]
my_hash.each do |x, y|
  puts "We had #{y} #{x} for dessert"
end


def my_first_ruby_method
    puts "First Mehtod"
end

def cubed_num(num)
    puts num**3
end

my_first_ruby_method
cubed_num(3)

#SPLAT ARGUMENTS are preceded by a * which tells Ruby were not sure how many arguments will be received
def print_names(*names)
  names.each {|x| puts "#{x}"}
end
print_names("Brady", "Scott", "Steve", "Judy")


#Sorting arrays
#Sort method will sort numerically and alpabetically 
numbers_odd = [9,5,3,7,1,11]

names_array = ["Brady", "Scott", "Steve", "Judy"]

puts numbers_odd.sort!
puts names_array.sort!
