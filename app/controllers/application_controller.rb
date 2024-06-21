class ApplicationController < ActionController::Base

    before_action :set_current_user, :set_locale

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def sign_in_to_account
        redirect_to sign_in_path, alert: "You must be sign in to change the password" if Current.user.nil? 
    end

    private

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options
        { locale: I18n.locale }
    end
end
