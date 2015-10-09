# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"


CSV.foreach('db/unit.csv') do |row|
  Unit.where(:id => row[0]).first_or_create(:id => row[0], :name => row[1])
end

CSV.foreach('db/member.csv') do |row|
  Member.where(:id => row[0]).first_or_create(:id => row[0], :name => row[1], :unit_id => row[2])
end
