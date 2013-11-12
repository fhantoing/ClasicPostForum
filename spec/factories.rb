FactoryGirl.define do

  factory :post do
    sequence(:title) { |n| "Post number #{n}" }
    content { Faker::Lorem.paragraphs(2).to_s }
    author {Faker::Internet.user_name }
    end

  factory :comment do
    author { Faker::Internet.user_name }
    content { Faker::Lorem.sentence }
    post
  end

end
