#CLASSES
#@ symbol creates an instance of that variable. Very similar to "this" in javascript
class Person
    def initialize(name)
        @name = name
    end
end

brady = Person.new("Brady") #creates a new person variable passing in "Brady" into the initialize method
puts "Brady object is #{brady}"
#working with class variables

class Person
  @@people_count = 0 #class variable
  def initialize(name)
    @name = name
    @@people_count += 1
  end

  def self.number_of_instances
    return @@people_count
  end
end

matz = Person.new("Yukihiro")
dhh = Person.new("David")

puts "Number of Person instances: #{Person.number_of_instances}" #outputs 2

#Working with inheritance
class ApplicationError
  def display_error
    puts "Error! Error!"
  end
end

class SuperBadError < ApplicationError #SuperBadError will inherit from ApplicationError #reads like SuperBadError inherits from ApplicationError
end

err = SuperBadError.new
err.display_error

class Message
    @@messages_sent = 0
   def initialize (from, to)
       @from = from
       @to = to
       @@messages_sent += 1
   end
end

class Email < Message
    def initialize (subject)
       @subject = subject
    end
end

class Computer
    @@users = {}
   def initialize(username, password)
       @username = username
       @password = password
       @files = {}
       @@users[username] = password
   end

   def create(filename)
      time = Time.now
      @files[filename] = time
      puts "New File Was Created #{filename}"
   end

   def Computer.get_users
      return @@users
   end
end

my_computer = Computer.new("bpeterson1663", "password")
my_computer.create("Journal.doc")

#WORKING WITH PRIVATE AND PUBLIC METHODS
#METHODS ARE PUBLIC BY DEFAULT
#WORKIGN WITH attr_reader and attr_writer

class Person
    attr_reader :name
    attr_writer :job
    attr_accessor :age #both readable and writable

  def initialize(name, job, age)
    @name = name
    @job = job
  end

end

=begin
  Code above is essentially this. It removes the name and job methods
  def initialize(name, job)
    @name = name
    @job = job
  end

  def name
    @name
  end

  def job=(new_job)
    @job = new_job
  end
=end

#prints out PI
puts "PI is #{Math::PI}"

#working with require
require "date" #this is ruby specific

puts "Date is: #{Date.today}"

#we can also use include so we dont have to use ::

module MartialArts
    def swordsman
       puts "I'm a swordsman."
    end
end

class Ninja
  include MartialArts
  def initialize(clan)
    @clan = clan
  end
end

class Samurai
  include MartialArts
  def initialize(shogun)
    @shogun = shogun
  end
end

module ThePresent
  def now
    puts "It's #{Time.new.hour > 12 ? Time.new.hour - 12 : Time.new.hour}:#{Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."
  end
end

class TheHereAnd
  extend ThePresent #allows TheHereAnd method to use ThePresent
end

TheHereAnd.now


class Account
   attr_reader :name
   attr_reader :balance

   def initialize(name, balance=100)
      @name = name
      @balance = balance
   end

   private
   def pin
        @pin = 1234
   end

   private
   def pin_error
      "Access denied: incorrect PIN."
   end

   public
   def display_balance(pin_number)
      if pin_number == pin
         puts "Balance: $#{balance}."
      else
          puts pin_error
      end
   end

   public
   def withdraw(pin_number, amount)
       if pin_number == pin
         if amount > @balance
           puts "You do not have enough in your account"
         elsif @balance -= amount
           puts "Withdrew #{amount}. New balance: $#{@balance}."
         end
       else
           pin_error
       end
    end

    public
    def deposit(pin_number, amount)
      if pin_number == pin
        @balance -= amount
        puts "Deposited #{amount}. New balance: $#{@balance}"
      end
    end
end

checking_account = Account.new("Brady", 10000000)
puts checking_account

puts checking_account.withdraw(1245, 2000)
puts checking_account.withdraw(1234, 2000)

puts checking_account.display_balance(1234)

puts checking_account.withdraw(1234, 900000)

puts checking_account.deposit(1234, 6000)

puts checking_account.withdraw(1234, 9000000)
puts checking_account.withdraw(1234, 9000000)
