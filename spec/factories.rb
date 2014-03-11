FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "valid#{n}@email.com"
    end

    password 'validpassword'
    password_confirmation 'validpassword'
  end

  factory :gadget do
    name "CD Player"
    description "The single greatest modern music player"
  end
end
