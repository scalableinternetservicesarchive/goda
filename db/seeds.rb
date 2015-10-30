# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

User.create(
    name: 'qqqq',
    password: '111111',
    password_confirmation: '111111'
)

User.create(
    name: 'wwww',
    password: '111111',
    password_confirmation: '111111'
)

User.create(
    name: 'eeee',
    password: '111111',
    password_confirmation: '111111'		
)

User.create(
    name: 'rrrr',
    password: '111111',
    password_confirmation: '111111'
)
User.create(
    name: 'tttt',
    password: '111111',
    password_confirmation: '111111'
)
User.create(
    name: 'yyyy',
    password: '111111',
    password_confirmation: '111111'
)
User.create(
    name: 'uuuu',
    password: '111111',
    password_confirmation: '111111'
)
User.create(
    name: 'iiii',
    password: '111111',
    password_confirmation: '111111'
)

