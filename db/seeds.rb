# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

Post.create!(:title => "MongoDB - Rails intregation", :content => Faker::Lorem.paragraphs(2).to_s, :author => Faker::Internet.user_name )
post = Post.create!(:title => "Scrum Team", :content => Faker::Lorem.paragraphs(2).to_s, :author => Faker::Internet.user_name)
Post.create!(:title => "Authentication with devise Rails 4.o", :content => Faker::Lorem.paragraphs(2).to_s, :author => Faker::Internet.user_name)

post.comments.create!(:author => Faker::Internet.user_name, :content => "Ok, it´s so complete!")
post.comments.create!(:author => Faker::Internet.user_name, :content => "shall continue")
post.comments.create!(:author => Faker::Internet.user_name, :content => "This article is good")