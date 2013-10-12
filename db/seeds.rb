# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

#Post.create!(:title => "BDD and specs Rails", :content => Faker::Lorem.paragraphs(2))
#Post.create!(:title => "Scrum BDD integration", :content => Faker::Lorem.paragraphs(2))
#post = Post.create!(:title => "Behavior-driven-development for experts", :content => Faker::Lorem.paragraphs(2))

#post.comments.create!(:author => "sinourain", :content => "Ok, it´s so complete!")
#post.comments.create!(:author => "alberto", :content => "shall continue")
#post.comments.create!(:author => "jazmin", :content => "This article is good")

#Option one

#Post.create(content: 'BDD content', title: 'BDD and specs')

#Option two

#Post.create(content: Faker::Lorem.paragraphs(2).to_s, title: 'BDD and specs Rails')
#Post.create(content: Faker::Lorem.paragraphs(2).to_s, title: 'Scrum BDD integration')
#post = Post.create(content: Faker::Lorem.paragraphs(2).to_s, title: 'Behavior-driven-development for experts')

#post.comments.create(content: 'Ok, it´s so complete!', author: 'sinourain')
#post.comments.create(content: 'shall continue', author: 'alberto')
#post.comments.create(content: 'This article is good', author: 'jazmin')

#Option three

Post.create!(:title => "MongoDB intregation", :content => Faker::Lorem.paragraphs(2).to_s)
post = Post.create!(:title => "Scrum Team", :content => Faker::Lorem.paragraphs(2).to_s)
Post.create!(:title => "Rails devise  with authentication", :content => Faker::Lorem.paragraphs(2).to_s)

post.comments.create!(:author => "juanda", :content => "Ok, it´s so complete!")
post.comments.create!(:author => "luisf", :content => "shall continue")
post.comments.create!(:author => "hectorfab", :content => "This article is good")