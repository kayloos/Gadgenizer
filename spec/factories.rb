FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "valid#{n}@email.com"
    end

    password 'validpassword'
    password_confirmation 'validpassword'
  end

  factory :gadget do
    sequence :name do |n|
      "CD Player #{n}"
    end
    description "The single greatest modern music player"
    user
  end
end
