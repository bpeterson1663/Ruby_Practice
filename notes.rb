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


#Combnied Comparison Operator
#uses <=> to compare to objects

=begin
 It returns 0 if the first operand (item to be compared) equals the second, 1 if first operand is greater than the second, and -1 if the first operand is less than the second.
=end

book_1 = "A Wrinkle in Time"

book_2 = "A Brief History of Time"

puts book_1 <=> book_2

books = ["Charlie and the Chocolate Factory", "War and Peace", "A Wrinkle in Time", "A Brief History of Time", "Utopia"]

puts books.sort! {|firstBook, secondBook| firstBook<=>secondBook}
#reverse order
puts books.sort! {|firstBook, secondBook| secondBook<=>firstBook}
#Ruby 1.9 does not use => when dealing with hashes. This has change to the :

my_new_hash = {
  cake: "chocolate",
  pie: "cherry",
  cookie: "snickerdoodle",
  }

puts my_new_hash[:cake]

#Using the select method
movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 3,
  truman_show: 4,
  red_dawn: 1.5,
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}

top_movies = movie_ratings.select {|name, rating| rating >2}
puts top_movies

#printing just key or just values
puts top_movies.each_key{|k| puts k}

puts top_movies.each_value{|v| puts v}


movies = {
    "The Rock" => 3
}
#Working on creating a basic movie rating system
movies = {
    "The Rock" => 3
}

puts "What Action would you like to take?"
puts "Enter add, update, display, or delete"
choice = gets.chomp

case choice
    when "add"
        puts "Enter the title of your movie"
        title = gets.chomp
        puts "Enter the rating"
        rating = gets.chomp
        if movies[title.to_sym] == nil
            movies[title.to_sym] = rating.to_i
            puts "Your admovie #{title} was entered"
        else
            puts "That movie is already entered"
        end
    when "update"
       puts "Enter the tile of the movie"
       title = gets.chomp
       if movies[title] == nil
           puts "That movies does not exist"
        else
            puts "Enter a new rating"
            rating = gets.chomp
            movies[title.to_sym] == rating.to_i
        end
    when "display"
        movies.each {|title, rating| puts "#{title}: #{rating}"}
    when "delete"
        puts "What Title do you want to delete"
        title = gets.chomp
        if movies[title] == nil
            puts "That movie does not exist"
        else
            movies.delete(title)
            puts "That movie was deleted"
        end
    else
        puts "Error!"
end

=begin
Using upto and downto methods
works very similar to a for loop
=end
90.upto(100) { |num| puts num*2} #starts at 90 and prints upt to 100 while multiplying it by two

100.downto(95) {|num| puts num} #starts at 100 and works down to 95

"A".upto("K") {|x| puts x} #starts at the letter a and prints up to k alphabetically

#using the shovel operator as a concantinator
new_array_2 = [1,4,5,6]
new_array_2 << 9 #will push 9 to the new_array_2
puts new_array_2

new_string = "Testing the shovel"
new_string << " concantinator"
puts new_string

#using a ternary comparison instead of an if statement
=begin
before using ternary compairson
  if 1 < 2
    puts "One is less than two!"
  else
    puts "One is not less than two."
  end
=end

#after
puts 1 < 2 ? "One is less than two!" : "One is not less than two."



=begin
  Working on practicing some of Ruby shorthand hand refactoring code
  Here is a chunk of code I was given to refactor
          $VERBOSE = nil    # We'll explain this at the end of the lesson.
          require 'prime'   # This is a module. We'll cover these soon!

          def first_n_primes(n)

            unless n.is_a? Integer
              return "n must be an integer."
            end

            if n <= 0
              return "n must be greater than 0."
            end

            prime_array = [] if prime_array.nil?

            prime = Prime.new
            for num in (1..n)
              prime_array.push(prime.next)
            end
            return prime_array
          end

          first_n_primes(10)

=end

#And refactored
require 'prime'

def first_n_primes(n)
  # Check for correct input!
  "n must be an integer" unless n.is_a? Integer
  "n must be greater than 0" if n <= 0

  # The Ruby 1.9 Prime class makes the array automatically!
  prime = Prime.instance
  return prime.first n
end

first_n_primes(10)