class Api::V1::InboundController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_user
	before_action :check_from
	before_action :check_to
	before_action :check_text

	def sms
		render json:                   {
			response_code: 200,
			response_message: 'Thanks'
		}
	end

	private

	def check_from
		from_length = begin
			params[:from].length
		rescue
			0
		end
		if from_length < 6 || from_length > 16
			render json:                  {
				response_code: 405,
				response_message: "#{I18n.t 'Invalid_from_number'}"
			}
		end

	end

	def check_to
		to_length = begin
			params[:to].length
		rescue
			0
		end
		if to_length < 6 || to_length > 16
			render json:                  {
				response_code: 405,
				response_message: "#{I18n.t 'Invalid_to_number'}"
			}
		end

	end

	def check_text
		text = begin
			params[:text].length
		rescue
			0
		end

		if text < 1 || text > 120
			render json:                  {
				response_code: 405,
				response_message: "#{I18n.t 'Invalid_text_length'}"
			}
		end
	end
end
