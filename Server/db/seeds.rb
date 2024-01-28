# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb

Task.create(title: 'Task 1', description: 'Description 1', status: :to_do, due_date: Time.now + 1.day)
Task.create(title: 'Task 2', description: 'Description 2', status: :in_progress, due_date: Time.now + 2.days)
Task.create(title: 'Task 3', description: 'Description 3', status: :done, due_date: Time.now + 3.days)
User.create(email: 'sample@gmail.com', password: '123456')