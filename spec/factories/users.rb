FactoryGirl.define do
  factory :user do
     email { "admin@admin.com" }
     password "password"
     password_confirmation "password"
   end

   trait :admin do
     admin true
   end

end
