FactoryGirl.define do
  factory :registered_app do
  	id						    { rand(1234567..9999999) }
  	token				      {SecureRandom.urlsafe_base64(nil, false)}
  	serial            {0}
  end
end

