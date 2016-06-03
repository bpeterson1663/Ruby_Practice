require 'pp' #pretty print styles output
require_relative 'user' #require_relative points to the user.rb file Relative relates to the where this file is stored in

user = User.new 'scott@example.com', 'Scott'

pp user

user.save