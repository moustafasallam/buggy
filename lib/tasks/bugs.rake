namespace :bugs do

  desc "add new bug"
  task :create => :environment do
    conductor = AmqpConductor.new
    data = conductor.receive || []
    data.each do |params|
      app = RegisteredApp.where(token: params["token"]).first
      puts "\n\n\napp: #{app.inspect}\n\n\n"
      if app.present?
        ActiveRecord::Base.transaction do
          app.update_serial
          bug = Bug.new
          bug.registered_app_id = app.id
          bug.number = app.serial
          bug.priority = params["bug"]["priority"]
          bug.comment = params["bug"]["comment"]
          browser = Browser.new(params["user_agent"])
          device = Device.new
          device.name = browser.device.name
          device.os = browser.platform.name
          device.memory = rand(1000..10000)
          device.storage = rand(10000..10000)
          device.save!
          bug.device_id = device.id
          bug.save!
        end
      end
    end
    conductor.close
  end

end
