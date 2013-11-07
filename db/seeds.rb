# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

USER_COUNT = 500.freeze
ENTRY_COUNT = 1000000.freeze
# USER_COUNT = 5.freeze
# ENTRY_COUNT = 2000.freeze

users = []

puts "creating users..."

USER_COUNT.times do |i|
  users << User.new(name: Faker::Internet.user_name)
end
User.import(users)

puts "creating entries..."

div = 1000
outer = ENTRY_COUNT/1000
outer.times do |i|
  entries = []
  div.times do |j|
    entries << Entry.new(
      title: Faker::Lorem.words(rand(5..10)).join(' '),
      content: Faker::Lorem.paragraphs(rand(5..15)).join("\n"),
      published_at: rand(100000000).seconds.ago
    )
  end
  puts "importing entries...(#{i+1}/#{outer})"
  Entry.import(entries)
end

puts "creating relations..."

Entry.all.find_each do |entry|
  relations = []
  User.order("RAND(#{Time.now.to_i})").first(rand(10..50)).each do |user|
    relations << Relationship.new(
      user_id:user.id,
      entry_id:entry.id,
      starred:rand()>0.98
    )
  end
  puts "importing relations...(#{entry.id}/#{ENTRY_COUNT})"
  Relationship.import(relations)
end

