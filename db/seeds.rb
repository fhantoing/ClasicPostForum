# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

Post.create!(:title => "BDD and specs Rails", :content => Faker::Lorem.paragraphs(2))
Post.create!(:title => "Scrum BDD integration", :content => Faker::Lorem.paragraphs(2))
post = Post.create!(:title => "Behavior-driven-development for experts", :content => Faker::Lorem.paragraphs(2))

post.comments.create!(:author => "sinourain", :content => "Ok, it´s so complete!")
post.comments.create!(:author => "alberto", :content => "shall continue")
post.comments.create!(:author => "jazmin", :content => "This article is good")

