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

board_list.each do |board|
  Board.create board
end
