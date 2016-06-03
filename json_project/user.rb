require 'json' #gives us the ability to work with json files

class User
  attr_accessor :email, :name, :permissions

  def initialize(*args) #* flat opperator creates an array args[0] = email args[1] = name etc.
    @email = args[0]
    @name = args[1]
    @permissions = User.permissions_from_template
  end

  def self.permissions_from_template
    file = File.read 'user_permissions_template.json' #reads the user_permission_template.json file and stores it into file
    JSON.load(file, nil, symbolize_names: true) #creates a json file out of the file variable
  end

  def save
    self_json = {email: @email, name: @name, permissions: @permissions}.to_json #need to save this to a file
    open('users.json', 'a') do |file| #appends this to the users.json file. If it does not exists than it creates it 
      file.puts self_json 
    end 
  end
end
