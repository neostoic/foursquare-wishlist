FactoryGirl.define do
  factory :user do |f|
    f.provider 'foursquare'
    f.uid '975478989'
    f.name { Faker::Name.name }
    f.photo { Faker::Internet.ip_v6_address }
    f.oauth_token 'HGBKJKG58790658HBVAQ679980LP'
  end
end