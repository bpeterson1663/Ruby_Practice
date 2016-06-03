phone_book = {
  "newyork" => "212",
  "minneapolis" => "612",
  "boston" => "555",
  "seatle" => "945",
  "chicago" => "412",
  "madison" => "608",
  "atlanta" => "312",
  "houston" => "515",
  "salem" => "712",
  "dallas" => "412"
 }

#method to display city names
def get_city_names(list)
 puts "Which city do you want the area code for?"
 list.each {|k,v| puts k}
  puts "Enter your selection"
end
# method to get area code by passing in the phone_book and the city name
def get_area_code(list, city)
  list[city] #access the value of the city on that hash
end
#loops through until the user says stop
loop do
  puts "Do you want to lookup a city name?(y/n)"
  answer = gets.chomp
  
  if answer !="y" #if answer is anything but y
    break
  end
  #if answer is y execute code
  get_city_names(phone_book)
 
  city = gets.chomp
 
  if phone_book.include?(city)#if the hash phone_book includes the city name entered byt the user
    puts "The area code for #{city} is #{get_area_code(phone_book, city)}" 
  else
    puts "You entered a city that is not in the phone book"
  end

end
