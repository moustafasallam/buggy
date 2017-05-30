require "bunny"

class AmqpConductor

	def initialize(bunny=Bunny.new(host: ENV['RABBITMQ_HOST']))
		@bunny = bunny
		@bunny.start
		@ch = @bunny.create_channel
		@queue  = @ch.queue("bugs.create", durable: true)
	end

	def send(data)
		@queue.publish(data, persistent: true, routing_key: "bugs.create")
	end

	def receive
		data = []
		@queue.subscribe(manual_ack: true) do |delivery_info, metadata, payload|
			data << JSON.parse(payload)
			@ch.ack(delivery_info.delivery_tag)
		end
		data
	end

	def close
		@bunny.close
	end

end