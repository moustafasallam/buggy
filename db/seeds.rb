tokens = []
0..30.times do |n|
	tokens << SecureRandom.urlsafe_base64(nil, false)
end

0..200.times do |n|
	bug = bug.new
	bug.app_token = tokens.sample
	bug.priority = Bug.priorities.sample
	bug.comment = Faker::Lorem.paragraph

	state = State.new
	state.device = ["iphone 5", "iphone 4", "iphone 6", "iphone 7"].sample
	state.os = ["IOS09", "IOS10", "IOS11", "IOS12"].sample
	state.memory = rand(1000..10000)
	state.storage = rand(10000..10000)
	state.save

	bug.state_id = state.id
	bug.save
end