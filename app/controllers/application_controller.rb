class ApplicationController < ActionController::Base
   def authenticate_user
      authenticate_or_request_with_http_basic do |username, password|
             username == 'username' && password == 'password'
             account = begin
                        Account.find_by(auth_id: password, username: username)
                      rescue
                        nil
                      end
             unless account.present?
               render json:                  {
                   response_code: 403,
                   response_message: "#{I18n.t 'Invalid_user_name_password'}"
                 }
             end
             @account = account
             return true
    end
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

	def check_parameters_present
		if params[:from].nil?
			render json: 
			{
				response_code: 403,
				response_message: "from #{I18n.t 'Parameter_is_missing'}"
			}
			return
		end
		if params[:to].nil?
			render json: 
			{
				response_code: 403,
				response_message: "to #{I18n.t 'Parameter_is_missing'}"
			}
			return
		end
		if params[:text].nil?
			render json: 
			{
				response_code: 403,
				response_message: "text #{I18n.t 'Parameter_is_missing'}"
			}
			return
		end
	end

end
