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


Comment.destroy_all
comments = [
  {description: 'Nice fruit',    author: client, rating: 4},
  {description: 'Good mashroom', author: client, rating: 5},
  {description: 'Good fruit',    author: admin,  rating: 3}
]
puts "Default comments: "
Comment.create!(comments).each do |comment|
  if comment.save
    puts comment.author.name
  else
    puts '>>> Comment not created!'
  end
end

comments = Comment.all
Blog.destroy_all
blogs = [
  {title: 'Apple',    description: 'Nice fruit',    category: Category.find_by(name: 'Apples'),    author: client, comment_ids: [comments[0].id], rating: 4},
  {title: 'Mashroom', description: 'Good mashroom', category: Category.find_by(name: 'Mashrooms'), author: client, comment_ids: [comments[1].id], rating: 2},
  {title: 'Papaia',   description: 'Good fruit',    category: Category.find_by(name: 'Papaia'),    author: admin,  comment_ids: [comments[2].id], rating: 5}
]
puts "Default blogs: "
Blog.create!(blogs).each do |blog|
  if blog.save
    puts blog.title
  else
    puts '>>> Blog not created!'
  end
end