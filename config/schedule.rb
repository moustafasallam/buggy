env :PATH, ENV['PATH']
set :output, "#{path}/log/cron.log"
set :bundle_command, "/usr/local/bin/bundle exec"
set :environment, ENV['RAILS_ENV']
ENV.each { |k, v| env(k, v) }

every 1.minute do
  rake "bugs:create"
end