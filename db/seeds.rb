# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([
  {
    nickname: 'GRHild',
    latitude: 10.000,
    longitude: -5.000,
    phone_id: '1234',
    rank: 3,
    email: 'grhild@gmail.com'
  },

  {
    nickname: 'Gmoney',
    latitude: 11.000,
    longitude: -4.000,
    phone_id: '1235',
    rank: 2,
    email: 'hild.gregory@gmail.com'
  },

  {
    nickname: 'Amy',
    latitude: 30.000,
    longitude: -34.000,
    phone_id: 'Amy',
    rank: 1,
    email: 'amyhton@gmail.com'
  }
])