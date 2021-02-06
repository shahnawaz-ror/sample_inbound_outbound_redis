class Api::V1::OutboundController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_user
	before_action :check_from
	before_action :check_to
	before_action :check_text
	def sms
		render json: 
			{
				response_code: 200,
				response_message: 'Thanks'
			}
	end
end
