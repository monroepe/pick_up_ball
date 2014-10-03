# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

locations = Location.create([{ name: "Washington Park", description: "The place is a dump. But the competition is great!", address: "123 Fake Street", city: "Boston", state: "MA", zip_code: "12345", user_id: 1 },
  { name: "Blue Park", description: "Great blue court. Wicked sweet water fountains. No toilet", address: "123 Real Street", city: "Boston", state: "MA", zip_code: "12345", user_id: 1 },
  { name: "Jefferson Park", description: "Lots of shade for rest. Quiet neighborhood. Lots of competition", address: "234 Main Street", city: "Boston", state: "MA", zip_code: "12345", user_id: 1 },
  { name: "Downtown YMCA", description: "Brand new court. Tough to find a game on Sundays, but every other day is good", address: "456 Bell Street", city: "Boston", state: "MA", zip_code: "12345", user_id: 1 }])


