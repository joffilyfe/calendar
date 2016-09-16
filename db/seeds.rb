# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create sample taks
3.times do |i|
  Task.create(title: "Sample task", date: Time.now + i.day)
end

# Create users
User.create(email: 'admin@admin.com', password: 'password', password_confirmation: 'password', admin: true);
User.create(email: 'user@user.com', password: 'password', password_confirmation: 'password');
