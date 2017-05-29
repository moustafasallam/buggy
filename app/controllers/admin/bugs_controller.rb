class Admin::BugsController < ApplicationController

	def index
		@bugs = params[:query].present? ? Bug.search(params[:query]) : []
	end

end