module Api::V1
	class BugsController < Api::BaseController
		skip_before_action :verify_authenticity_token

		def show
			@app = RegisteredApp.where(token: params[:token]).first
			@bug = @app.bugs.where(number: params[:id].to_i).first if @app.present?
			@bug.present? ? success() : error(404, "record no found!")
		end

		def create
			conductor = AmqpConductor.new
			params[:user_agent] = request.env['HTTP_USER_AGENT']
			conductor.send(params.to_json)
			conductor.close
			success({})
		end

	end
end