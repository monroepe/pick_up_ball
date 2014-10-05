# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'rest_client'

results = RestClient.get("kimonolabs.com/api/a7bz61mi?apikey=#{ENV['KIMONO_API_KEY']}")
courts = JSON.parse(results)
courts["results"]["collection1"].each do |row|
  locations = Location.create(address: row["addressofBronxPark"]["text"], name: row["nameofBronxPark"])
end

