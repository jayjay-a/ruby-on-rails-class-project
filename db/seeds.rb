# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#resets all sequences to latest id on table
User.delete_all
Channel.delete_all
Board.delete_all
Post.delete_all
ActiveRecord::Base.connection.tables.each do |table|
  result = ActiveRecord::Base.connection.execute("SELECT id FROM #{table} ORDER BY id DESC LIMIT 1") rescue ( puts "Warning: not procesing table #{table}. Id is missing?" ; next )
  ai_val = result.any? ? result.first['id'].to_i + 1 : 1
  puts "Resetting auto increment ID for #{table} to #{ai_val}"
  ActiveRecord::Base.connection.execute("ALTER SEQUENCE #{table}_id_seq RESTART WITH #{ai_val}")
end

#delete all info in that table then create default data via seed
User.create({"fname"=>"Alex",     "lname"=>"Tjon",      "username"=>"atjon",      "password"=>"password", "role"=>"user"})
User.create({"fname"=>"William",  "lname"=>"Ashby",     "username"=>"washby",     "password"=>"password", "role"=>"manager"})
User.create({"fname"=>"Katie",    "lname"=>"Trujillo",  "username"=>"ktrujillo",  "password"=>"password", "role"=>"user"})
User.create({"fname"=>"Julius",   "lname"=>"Agno",      "username"=>"jayjay",     "password"=>"password", "role"=>"manager"})
User.create({"fname"=>"Keith",    "lname"=>"Lancaster", "username"=>"admin",      "password"=>"password", "role"=>"manager"})
#you can also use ruby code "supposedly" to do it too, used an array but probably better for table with lot of attributes

Channel.create({"name"=>"Research and Development"})
Channel.create({"name"=>"Ruby on Rails"})
Channel.create({"name"=>"New Products"})
Channel.create({"name"=>"Company Events"})
Channel.create({"name"=>"Helpdesk"})

#Board.create!({"name"=>"J.U.L.I.U.S.","user_id"=>"1","channel_id"=>"1","created_at"=>"2017-12-01 at 00:00"})
board_list = [
    {name: 'J.U.L.I.U.S.',user_id:1,channel_id:1,created_at: '2017-12-01 at 00:00'},
    {name: 'Project N M A Dungeon', user_id:2 ,channel_id:2,created_at: '2017-12-01 at 00:00'},
    {name: 'Phoenix', user_id:3 ,channel_id: 1,created_at: '2017-12-02 at 00:00'},
    {name: 'Migrations', user_id:4 ,channel_id: 3,created_at: '2017-12-02 at 00:00'},
    {name: 'Q2 Promotional Items', user_id:5 ,channel_id: 4,created_at: '2017-12-02 at 00:00'},
    {name: 'Novelty Inventory', user_id:2 ,channel_id: 1,created_at: '2017-12-03 at 00:00'},
    {name: 'Margin Megathread', user_id:5 ,channel_id: 2,created_at: '2017-12-03 at 00:00'},
    {name: 'CoT Grillfest', user_id:4 ,channel_id: 4,created_at: '2017-12-03 at 00:00'},
    {name: 'Ruby Problems', user_id:3 ,channel_id: 3,created_at: '2017-12-04 at 00:00'},
    {name: 'Rail Problems', user_id:2 ,channel_id: 3,created_at: '2017-12-05 at 00:00'},
    {name: 'PSA: Try turning it on and off again', user_id:1 ,channel_id: 5,created_at: '2017-12-05 at 00:00'},
    {name: 'Campus Recruiting at UH', user_id:1 ,channel_id: 3,created_at: '2017-12-05 at 00:00'}
]
board_list.each do |board|
  Board.create board
end

post_list = [
    { board_id: 1 ,   user_id: 1, message: 'j u l i u s' ,created_at: '2017-12-01 at 00:00'},
    { board_id: 2 ,   user_id: 2, message: 'Is it open yet?' ,created_at: '2017-12-02 at 00:00'},
    { board_id: 3 ,   user_id: 3, message: 'What is Elixir?' ,created_at: '2017-12-05 at 00:00'},
    { board_id: 4 ,   user_id: 4, message: 'What does db:migrate do?' ,created_at: '2017-12-06 at 00:00'},
    { board_id: 5 ,   user_id: 5, message: 'Why arent we running szechuan sauce? ' ,created_at: '2017-12-05 at 00:00'},
    { board_id: 6 ,   user_id: 1, message: 'What gag gift do you have to jolly your dolly?' ,created_at: '2017-12-05 at 00:00'},
    { board_id: 7 ,   user_id: 2, message: 'ALL IN JNUG?' ,created_at: '2017-12-04 at 00:00'},
    { board_id: 8 ,   user_id: 3, message: 'So who was it who was drinking at Grillfest but was not at work?' ,created_at: '2017-12-04 at 00:00'},
    { board_id: 9 ,   user_id: 4, message: 'student_age.sum?' ,created_at: '2017-12-02 at 00:00'},
    { board_id: 10 ,  user_id: 5, message: 'User.find("LandMASTER")?' ,created_at: '2017-12-03 at 00:00'},
    { board_id: 11 ,  user_id: 1, message: 'I tried to turn it on and off abut I could not turn it on.' ,created_at: '2017-12-0405 at 00:00'},
    { board_id: 12 ,  user_id: 2, message: 'We are exclusively hiring from the CIS program.' ,created_at: '2017-12-02 at 00:00'},
    { board_id: 1 ,   user_id: 3, message: 'j a y j a y' ,created_at: '2017-12-05 at 00:00'},
    { board_id: 2 ,   user_id: 4, message: 'Open up Julius.' ,created_at: '2017-12-01 at 00:00'},
    { board_id: 3 ,   user_id: 5, message: 'A language for Phoenix' ,created_at: '2017-12-01 at 00:00'},
    { board_id: 4 ,   user_id: 1, message: 'It migrates the db' ,created_at: '2017-12-03 at 00:00'},
    { board_id: 5 ,   user_id: 2, message: 'You have to have a very high IQ to understand our marketing.' ,created_at: '2017-12-02 at 00:00'},
    { board_id: 6 ,   user_id: 3, message: 'What does that even mean?' ,created_at: '2017-12-01 at 00:00'},
    { board_id: 7 ,   user_id: 4, message: 'RIDING IT TO THE MOON' ,created_at: '2017-12-02 at 00:00'},
    { board_id: 8 ,   user_id: 5, message: 'Not me' ,created_at: '2017-12-03 at 00:00'},
    { board_id: 9 ,   user_id: 1, message: 'well it is no student_age.map?' ,created_at: '2017-12-04 at 00:00'},
    { board_id: 10 ,  user_id: 2, message: 'User.find("Fox") do each |barrelroll| ' ,created_at: '2017-12-05 at 00:00'},
    { board_id: 11 ,  user_id: 3, message: 'Is it plugged in?' ,created_at: '2017-12-01 at 00:00'},
    { board_id: 12 ,  user_id: 4, message: 'And only people who took Professor Lancaster.  ' ,created_at: '2017-12-01 at 00:00'},
]

post_list.each do |post|
  Post.create post
end

# group_list = [
#     {name: 'Sales'},
#     {name: 'IT'},
#     {name: 'Engineering'},
#     {name: 'Human Resources'}
# ]

# group_list.each do |group|
#   Group.create group
# end


# ChannelGroup.delete_all
# channel_group_list = [
#     {group_id: 1 , channel_id: 1},
#     {group_id: 1 , channel_id: 2},
#     {group_id: 2 , channel_id: 3},
#     {group_id: 2 , channel_id: 4},
#     {group_id: 3 , channel_id: 5},
#     {group_id: 3 , channel_id: 6},
#     {group_id: 4 , channel_id: 8},
#     {group_id: 4 , channel_id: 11},
#     {group_id: 4 , channel_id: 12},
#     {group_id: 5 , channel_id: 9},
#     {group_id: 5 , channel_id: 10}
# ]

# channel_group_list.each do |channel_group|
#   ChannelGroup.create channel_group
# end


# UserGroup.delete_all
# user_group_list = [
#     {group_id: 2 , user_id: 1},
#     {group_id: 3 , user_id: 2},
#     {group_id: 4 , user_id: 3},
#     {group_id: 1 , user_id: 4},
#     {group_id: 2 , user_id: 5},
# ]

# user_group_list.each do |user_group|
#   UserGroup.create user_group
# end

# UserStatus.delete_all
# user_statuses_list = [
#     {status_description: 'active' , user_id: 1},
#     {status_description: 'active' , user_id: 2},
#     {status_description: 'active' , user_id: 3},
#     {status_description: 'active' , user_id: 4},
#     {status_description: 'active' , user_id: 5},
# ]

# user_statuses_list.each do |user_statuses|
#   UserStatus.create user_statuses
# end

# UserRole.delete_all
# user_role_list = [
#     {role_description: 'admin' , user_id: 1},
#     {role_description: 'admin' , user_id: 4},
#     {role_description: 'admin' , user_id: 5}
# ]

# user_role_list.each do |user_role|
#   UserRole.create user_role
# end