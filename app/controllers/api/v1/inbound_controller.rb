class Api::V1::InboundController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_user
	before_action :check_from
	before_action :check_to
	before_action :check_text
	before_action :check_to_exists
	def sms
		redis = Redis.new(host: "localhost")
		if params[:text] == "STOP"
			redis.set("#{@account.username+"_#{params[:from]}/#{params[:to]}"}","#{params[:from]}/#{params[:to]}",ex: 4.hours)
		end
		render json: 
			{
				response_code: 200,
				response_message: 'inbound sms ok'
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
