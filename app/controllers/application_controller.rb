class ApplicationController < ActionController::Base
	def authenticate_user
		 authenticate_or_request_with_http_basic do |username, password|
            username == 'username' && password == 'password'
            account = Account.find_by(auth_id: password, username: username) rescue nil
            unless account.present?
	            render :json =>
	              {
	                response_code: 403,
	                response_message: "#{I18n.t 'Invalid_user_name_password'}"
	            }
            end
            return true
        end
	end
end
