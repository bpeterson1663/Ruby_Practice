
#Creates a module typical naming convention ends in able
module Destructable
  def destroy(object)
    puts "Destroys object"
  end
end
#constructor
class User
  include Destructable #includes module
  attr_accessor :name, :email #getter and setter methods summed up
  def initialize(name, email) #when called initialize new instance of the object
    @name = name 
    @email = email
  end
  def run
    puts "Hey I'm running"
  end
  #example of a class method
  def self.identify_yourself
    puts "Hey I am a class method"
  end
end
#inheritance Constructors inheriting from User class
class Buyer < User
  def run
    puts "Hey Im not running"
  end
end

class Seller < User

end

class Admin < User

end
#creating a new instance of an object
user = User.new("Brady" , "test")


#puts User.ancestors
#examples of accessing #methods inside classes
buyer1 = Buyer.new("Brady" , "bpeterson@test.com")
buyer1.run
seller1 = Seller.new("Steve" , "steve@test.com")
seller1.run
admin1 = Admin.new("Scott" , "scott@test.com")
admin1.run
puts Buyer.ancestors

User.identify_yourself

buyer1.destroy(seller1)
