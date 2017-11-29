# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#resets all sequences to latest id on table
#ActiveRecord::Base.connection.tables.each do |table|
#    result = ActiveRecord::Base.connection.execute("SELECT id FROM #{table} ORDER BY id DESC LIMIT 1") rescue ( puts "Warning: not procesing table #{table}. Id is missing?" ; next )
#    ai_val = result.any? ? result.first['id'].to_i + 1 : 1
#    puts "Resetting auto increment ID for #{table} to #{ai_val}"
#    ActiveRecord::Base.connection.execute("ALTER SEQUENCE #{table}_id_seq RESTART WITH #{ai_val}")
#end

#delete all info in that table then create default data via seed
#User.delete_all
User.create({"fname"=>"Alex", "lname"=>"Tjon", "username"=>"atjon", "password"=>"password"})
User.create({"fname"=>"William", "lname"=>"Ashby", "username"=>"washby", "password"=>"password"})
User.create({"fname"=>"Katie", "lname"=>"Trujillo", "username"=>"ktrujillo", "password"=>"password"})
User.create({"fname"=>"Julius", "lname"=>"Agno", "username"=>"jayjay", "password"=>"jayjay"})
User.create({"fname"=>"Keith", "lname"=>"Lancaster", "username"=>"admin", "password"=>"password"})

#you can also use ruby code "supposedly" to do it too, used an array but probably better for table with lot of attributes


Channel.delete_all
Channel.create({"name"=>"Research and Development"})
Channel.create({"name"=>"Ruby on Rails"})
Channel.create({"name"=>"New Products"})
Channel.create({"name"=>"Company Events"})
Channel.create({"name"=>"Helpdesk"})

Board.delete_all
board_list = [
    {name: 'J.U.L.I.U.S.' , channel_id: 1},
    {name: 'Project N M A Dungeon' , channel_id: 1},
    {name: 'Phoenix' , channel_id: 2},
    {name: 'Migrations' , channel_id: 2},
    {name: 'Q2 Promotional Items' , channel_id: 3},
    {name: 'Novelty Inventory' , channel_id: 3},
    {name: 'Margin Megathread' , channel_id: 3},
    {name: 'CoT Grillfest' , channel_id: 4},
    {name: 'Ruby Problems' , channel_id: 5},
    {name: 'Rail Problems' , channel_id: 5},
    {name: 'PSA: Try turning it on and off again' , channel_id: 5},
    {name: 'Campus Recruiting at UH' , channel_id: 4}
]
Group.delete_all
group_list = [
    {name: 'Sales'},
    {name: 'IT'},
    {name: 'Engineering'},
    {name: 'Human Resources'}
]

group_list.each do |group|
  Group.create group
end
board_list.each do |board|
  Board.create board
end

ChannelGroup.delete_all
channel_group_list = [
    {group_id: 1 , channel_id: 1},
    {group_id: 1 , channel_id: 2},
    {group_id: 2 , channel_id: 3},
    {group_id: 2 , channel_id: 4},
    {group_id: 3 , channel_id: 5},
    {group_id: 3 , channel_id: 6},
    {group_id: 4 , channel_id: 8},
    {group_id: 4 , channel_id: 11},
    {group_id: 4 , channel_id: 12},
    {group_id: 5 , channel_id: 9},
    {group_id: 5 , channel_id: 10}
]

channel_group_list.each do |channel_group|
  ChannelGroup.create channel_group
end


UserGroup.delete_all
user_group_list = [
    {group_id: 2 , user_id: 1},
    {group_id: 3 , user_id: 2},
    {group_id: 4 , user_id: 3},
    {group_id: 1 , user_id: 4},
    {group_id: 2 , user_id: 5},
]

user_group_list.each do |user_group|
  UserGroup.create user_group
end

UserStatus.delete_all
user_statuses_list = [
    {status_description: 'active' , user_id: 1},
    {status_description: 'active' , user_id: 2},
    {status_description: 'active' , user_id: 3},
    {status_description: 'active' , user_id: 4},
    {status_description: 'active' , user_id: 5},
]

user_statuses_list.each do |user_statuses|
  UserStatus.create user_statuses
end

UserRole.delete_all
user_role_list = [
    {role_description: 'admin' , user_id: 1},
    {role_description: 'admin' , user_id: 4},
    {role_description: 'admin' , user_id: 5}
]

user_role_list.each do |user_role|
  UserRole.create user_role
end

Post.delete_all
post_list = [
    { board_id: 1 , message: 'j u l i u s' },
    { board_id: 2 , message: 'Is it open yet?' },
    { board_id: 3 , message: 'What is Elixir?' },
    { board_id: 4 , message: 'What does db:migrate do?' },
    { board_id: 5 , message: 'Why arent we running szechuan sauce? ' },
    { board_id: 6 , message: 'What gag gift do you have to jolly your dolly?' },
    { board_id: 7 , message: 'ALL IN JNUG?' },
    { board_id: 8 , message: 'So who was it who was drinking at Grillfest but was not at work?' },
    { board_id: 9 , message: 'student_age.sum?' },
    { board_id: 10 , message: 'User.find("LandMASTER")?' },
    { board_id: 11 , message: 'I tried to turn it on and off abut I could not turn it on.' },
    { board_id: 12 , message: 'We are exclusively hiring from the CIS program.' },
    { board_id: 1 , message: 'j a y j a y' },
    { board_id: 2 , message: 'Open up Julius.' },
    { board_id: 3 , message: 'A language for Phoenix' },
    { board_id: 4 , message: 'It migrates the db' },
    { board_id: 5 , message: 'You have to have a very high IQ to understand our marketing.' },
    { board_id: 6 , message: 'What does that even mean?' },
    { board_id: 7 , message: 'RIDING IT TO THE MOON' },
    { board_id: 8 , message: 'Not me' },
    { board_id: 9 , message: 'well it is no student_age.map?' },
    { board_id: 10 , message: 'User.find("Fox") do each |barrelroll| ' },
    { board_id: 11 , message: 'Is it plugged in?' },
    { board_id: 12 , message: 'And only people who took Professor Lancaster.  ' },
]

post_list.each do |post|
  Post.create post
end