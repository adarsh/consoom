FactoryGirl.define do
  factory :book do
    isbn '123456789'
    title 'The Greatest Book Ever'
    author 'John Henry'
    image_url 'image.jpg'
    amazon_url 'http://www.amazon.com'
    asin '123456789'
  end

  factory :user do
    first 'Joe'
    last 'User'
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation { |u| u.password }

    factory :admin do
      admin true
    end
  end
end
