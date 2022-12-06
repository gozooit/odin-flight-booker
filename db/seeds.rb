# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p 'Deleting airports.'

Airport.delete_all

Airport.create(
  [
    {
      code: 'ATL',
      name: 'Hartsfield-Jackson Atlanta International Airport',
      city: 'Atlanta, Georgia',
      country: 'United States'
    },
    {
      code: 'DFW',
      name: 'Dallas Fort Worth International Airport',
      city: 'Dallas-Fort Worth, Texas',
      country: 'United States'
    },
    {
      code: 'DEN',
      name: 'Denver International Airport',
      city: 'Denver, Colorado',
      country: 'United States'
    },
    {
      code: 'ORD',
      name: "O'Hare International Airport",
      city: 'Chicago, Illinois',
      country: 'United States'
    },
    {
      code: 'LAX',
      name: 'Los Angeles International Airport',
      city: 'Los Angeles, California',
      country: 'United States'
    },
    {
      code: 'CLT',
      name: 'Charlotte Douglas International Airport',
      city: 'Charlotte, North Carolina',
      country: 'United States'
    },
    {
      code: 'MCO',
      name: 'Orlando International Airport',
      city: 'Orlando, Florida',
      country: 'United States'
    },
    {
      code: 'CAN',
      name: 'Guangzhou Baiyun InChina ternational Airport',
      city: 'Baiyun-Huadu, Guangzhou, Guangdong',
      country: 'China'
    },
    {
      code: 'CTU',
      name: 'Chengdu Shuangliu International Airport',
      city: 'Shuangliu-Wuhou, Chengdu, Sichuan',
      country: 'China'
    },
    {
      code: 'IST',
      name: 'Istanbul Airport',
      city: 'Arnavutköy, Istanbul',
      country: 'Turkey'
    },
    {
      code: 'MEX',
      name: 'Mexico City International Airport',
      city: 'Venustiano Carranza, Mexico City',
      country: 'Mexico'
    },
    {
      code: 'SVO',
      name: 'Sheremetyevo International Airport',
      city: 'Khimki, Moscow Oblast',
      country: 'Russia'
    },
    {
      code: 'DXB',
      name: 'Dubai International Airport',
      city: 'Garhoud, Dubai',
      country: 'United Arab Emirates'
    },
    {
      code: 'CDG',
      name: 'Charles de Gaulle Airport',
      city: 'Roissy-en-France, Île-de-France',
      country: 'France'
    }
  ]
)

p "Created #{Airport.count} airports."

p 'Deleting flights.'

Flight.delete_all

100.times do
  departure = rand(1..Airport.count)
  arrival = rand(1..Airport.count)
  arrival = rand(1..Airport.count) while departure == arrival
  start = Time.now + rand(2_000_000)
  duration = rand(1_800..18_000)
  Flight.create(
    departure_airport_id: departure,
    arrival_airport_id: arrival,
    start: start,
    duration: duration
  )
end

p "Created #{Flight.count} flights."
