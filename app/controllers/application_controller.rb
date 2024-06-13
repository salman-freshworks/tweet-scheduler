class ApplicationController < ActionController::Base

    before_action :set_current_user

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def sign_in_to_account
        redirect_to sign_in_path, alert: "You must be sign in to change the password" if Current.user.nil? 
    end
end
