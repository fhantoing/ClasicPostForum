FactoryGirl.define do

  factory :post do
    #title "A post title"
    #content "Post content"
    sequence(:title) { |n| "Post number #{n}" }
    content { Faker::Lorem.paragraphs(2).to_s }
  end

  factory :comment do
    author { Faker::Internet.user_name }
    content { Faker::Lorem.sentence }
    post
  end

end
