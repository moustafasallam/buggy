FactoryGirl.define do
  factory :device do
  	id						    { rand(1234567..9999999) }
  	name  				    {["iphone 5", "iphone 4", "iphone 6", "iphone 7"].sample}
    os                {["IOS09", "IOS10", "IOS11", "IOS12"].sample}
    memory            {rand(10000..10000)}
    storage           {rand(10000..10000)}
  end
end