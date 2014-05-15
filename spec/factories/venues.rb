FactoryGirl.define do
  factory :venue do |f|
    f.name { Faker::Address.street_name }
    f.photo { Faker::Internet.ip_v6_address }
    f.fs_id 'HGBKJKG58790658HBVAQ679980LP'
    f.wishlist_id { 1 }
  end
end