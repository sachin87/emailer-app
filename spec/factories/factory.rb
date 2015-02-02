FactoryGirl.define do
  factory :contact do
    sequence(:email)   {|n| "person#{n}@example.com" }
  end

  factory :message do
    subject "Hello World"
    schedule_date DateTime.now
    time_zone "New Delhi"
    body "Good Morning Everyone"
  end

end