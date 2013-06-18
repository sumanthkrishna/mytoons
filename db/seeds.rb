# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user  = User.create! :first_name => 'Publisher', :last_name => '1' , :phone_number => '1234567890' , :email => 'publisher1@example.com', :password => 'please', :password_confirmation => 'please'
#puts 'New user created: ' << user.first_name
#user.add_role :Publisher
#
#user  = User.create! :first_name => 'M', :last_name => '1' , :phone_number => '1234567890' , :email => 'publisher1@example.com', :password => 'please', :password_confirmation => 'please'
#puts 'New user created: ' << user.first_name
#user.add_role :Publisher
#
#user  = User.create! :first_name => 'Publisher', :last_name => '1' , :phone_number => '1234567890' , :email => 'publisher1@example.com', :password => 'please', :password_confirmation => 'please'
#puts 'New user created: ' << user.first_name
#user.add_role :Publisher
#
#user  = User.create! :first_name => 'Publisher', :last_name => '1' , :phone_number => '1234567890' , :email => 'publisher1@example.com', :password => 'please', :password_confirmation => 'please'
#puts 'New user created: ' << user.first_name
#user.add_role :Publisher
#
#user  = User.create! :first_name => 'Publisher', :last_name => '1' , :phone_number => '1234567890' , :email => 'publisher1@example.com', :password => 'please', :password_confirmation => 'please'
#puts 'New user created: ' << user.first_name
#user.add_role :Publisher

["SystemAdmin","Moderator","Publisher","User"].each do |u|
  user = User.create! :first_name => u, :last_name => '1' , :phone_number => '1234567890' , 
  :email => "#{u}@example.com", :password => 'please', :password_confirmation => 'please'
  puts 'New user created: ' << user.first_name
  user.add_role u
end



