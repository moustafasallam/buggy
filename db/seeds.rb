0..90.times do |n|
	app = RegisteredApp.new
	app.token = loop do
    random_token = SecureRandom.urlsafe_base64(nil, false)
    break random_token unless RegisteredApp.exists?(token: random_token)
  end
  app.save!
end

0..600.times do |n|
	ActiveRecord::Base.transaction do
		app = RegisteredApp.order("RANDOM()").first
		app.update_serial
		bug = Bug.new
		bug.registered_app_id = app.id
		bug.number = app.serial
		bug.priority = Bug.priorities.sample
		bug.comment = Faker::Lorem.paragraph

		device = Device.new
		device.name = ["iphone 5", "iphone 4", "iphone 6", "iphone 7"].sample
		device.os = ["IOS09", "IOS10", "IOS11", "IOS12"].sample
		device.memory = rand(1000..10000)
		device.storage = rand(10000..10000)
		device.save!

		bug.device_id = device.id
		bug.save!
	end
end