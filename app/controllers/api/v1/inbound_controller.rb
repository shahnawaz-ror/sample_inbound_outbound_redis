class Api::V1::InboundController < ApplicationController
	 skip_before_action :verify_authenticity_token
	before_action :authenticate_user

	def sms
		render :json =>
	              {
	                response_code: 200,
	                response_message: "Thanks"
	            }
	end
end
