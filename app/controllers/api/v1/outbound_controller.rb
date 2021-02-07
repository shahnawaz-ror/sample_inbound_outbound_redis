class Api::V1::OutboundController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_user,:check_parameters_present, :check_from, :check_to, :check_text, :check_from_exists
	def sms
		redis = Redis.new(host: "localhost")
		redis_data = redis.get("#{@account.username+"_#{params[:from]}/#{params[:to]}"}")
		if redis_data
			render json: 
				{
					response_code: 200,
					response_message: 'outbound sms ok'
				}
		else
			render json: 
				{
					response_code: 200,
					response_message: 'unknown failure'
				}
		end
					
	end
	private
		def check_from_exists
		account_number = @account.phone_numbers.find_by(number: params[:from]) rescue nil
		unless account_number.present?
			render json: 
			{
				response_code: 403,
				response_message: "#{I18n.t 'From_is_missing'}"
			}
		end	
	end
end
