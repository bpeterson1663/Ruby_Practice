// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
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
