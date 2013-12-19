# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.destroy_all
roles = Role.create([ 
  {title: "admin"},
  {title: "client"}
])
if roles[0].save and roles[1].save
  puts "Default roles: " + roles.map(&:title).join(', ')
else
  puts '>>> Roles not created!'
end

User.destroy_all
users = User.create([
  {role_id: roles[0], name: 'admin',  password: 'admin',  password_confirmation: 'admin'},
  {role_id: roles[1], name: 'client', password: 'client', password_confirmation: 'client'}
])
if users[0].save and users[1].save
  puts "Default users: " + users.map(&:name).join(', ')
else
  puts '>>> User not created!'
end
admin  = users[0]
client = users[1]

Category.destroy_all
categories = [
  {name: 'Apples'},
  {name: 'Mashrooms'},
  {name: 'Papaia'}
]
puts "Default categories: "
Category.create(categories).each do |category|
  if category.save
    puts category.name
  else
    puts '>>> Category not created!'
  end
end

Blog.destroy_all
blogs = [
  {title: 'Apple', description: 'Nice fruit', category: Category.find_by(name: 'Apples'), author: client, rating: 4.5}
]
puts "Default blogs: "
Blog.create!(blogs).each do |blog|
  if blog.save
    puts blog.title
  else
    puts '>>> Blog not created!'
  end
end