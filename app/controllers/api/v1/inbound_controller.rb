class Api::V1::InboundController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_user,:check_parameters_present,:check_from, :check_to, :check_text, :check_to_exists
	#Inbound sms need to authenticate first
	def sms
		redis = Redis.new(host: ENV.fetch("REDIS_URL"))
		if ["STOP","STOP\n","STOP\r", "STOP\r\n"].include? params[:text]
			redis.set("#{@account.username+"_#{params[:from]}/#{params[:to]}"}","#{params[:from]}/#{params[:to]}",ex: 4.hours)
		end
		render json: 
			{
				response_code: 200,
				response_message: "#{I18n.t 'Inbound_ok'}"
			}
	end

	private
		def check_to_exists
			account_number = @account.phone_numbers.find_by(number: params[:to]) rescue nil
			unless account_number.present?
				render json: 
				{
					response_code: 403,
					response_message: "#{I18n.t 'To_is_missing'}"
				}
			end	
		end
end
