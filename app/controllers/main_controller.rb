class MainController < ApplicationController
    def index
        flash.now[:notice] = "Enter password to login"
        flash.now[:alert] = "Incorrect password"
    end
end
