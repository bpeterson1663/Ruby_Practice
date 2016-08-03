#CLASSES
#@ symbol creates an instance of that variable. Very similar to "this" in javascript
class Person
    def initialize(name)
        @name = name
    end
end

brady = Person.new("Brady") #creates a new person variable passing in "Brady" into the initialize method
puts "Brady object is #{brady}"