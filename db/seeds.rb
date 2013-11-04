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
    latitude: 30.2921168,
    longitude: -97.72472259999999,
    phone_id: '1234',
    rank: 3,
    email: 'grhild@gmail.com'
  },

  {
    nickname: 'Karinn',
    latitude: 30.291916,
    longitude: -97.724963,
    phone_id: '1235',
    rank: 2,
    email: 'karinnhemingway@gmail.com'
  },

  {
    nickname: 'Amy',
    latitude: 30.2923333,
    longitude: -97.7247403,
    phone_id: 'Amy',
    rank: 1,
    email: 'amyhton@gmail.com'
  },

  {
    nickname: 'Bryant',
    latitude: 33.768321,
    longitude: -118.1956168,
    phone_id: '1337',
    rank: 4,
    email: 'amyhton@gmail.com'
  },

  {
    nickname: 'Greg',
    latitude: 30.267153,
    longitude: -97.7430608,
    phone_id: '9989',
    rank: 5,
    email: 'hild.gregory@gmail.com'
  }
])

devices = Device.create ([
  {
    user_id: 1,
    token: '338DB16ED548E601', 
    enabled: true,
    platform: 'Android'
  }

])

