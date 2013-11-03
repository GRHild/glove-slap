# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{ nickname: 'GRHild', location: '78752', phone_id: '1234', rank: 1, email: 'grhild@gmail.com' }, { nickname: 'Gmoney', location: '78752', phone_id: '1235', rank: 3, email: 'hild.gregory@gmail.com' }, { nickname: 'Amy', location: '', phone_id: '1236', rank: 2, email: 'amyhton@gmail.com' }])