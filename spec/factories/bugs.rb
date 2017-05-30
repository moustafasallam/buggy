FactoryGirl.define do
  factory :bug do
  	id						    { rand(1234567..9999999) }
  	number				    {0}
    state             {"new"}
    priority          {"minor"}
    comment           {Faker::Lorem.paragraph}
    association  :device, factory: :device, strategy: :build
    association  :registered_app, factory: :registered_app, strategy: :build

    after(:create) do |bug, evaluator|
      evaluator.registered_app.serial += 1
      bug.number = evaluator.registered_app.serial
    end

  end
end

