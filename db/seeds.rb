# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.where(username: 'admin').first_or_create(username: 'admin', password: 'password', password_confirmation: 'password', is_super_user: true)
User.where(username: 'user').first_or_create(username: 'user', password: 'password', password_confirmation: 'password', is_super_user: true)
User.where(username: 'tester').first_or_create(username: 'tester', password: 'password', password_confirmation: 'password', is_super_user: true)

Grade.find_or_create_by(name: "ថ្នាក់ទី ១", code: 1)
Grade.find_or_create_by(name: "ថ្នាក់ទី ២", code: 2)
Grade.find_or_create_by(name: "ថ្នាក់ទី ៣", code: 3)

WritingMethod.find_or_create_by(name: "របៀបសរសេរ", icon: "how-to-write", code: 1)
WritingMethod.find_or_create_by(name: "សរសេរតាមមេីល",  icon: "write-following-eyes", code: 2)
WritingMethod.find_or_create_by(name: "សរសេរតាមស្តាប់", icon: "write-following-listening", code: 3)
WritingMethod.find_or_create_by(name: "សរសេរតាមរូបភាព", icon: "write-following-picture", code: 4)
