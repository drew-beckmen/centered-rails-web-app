class SessionsController < ApplicationController 
    skip_before_action :authenticated, only: [:new, :create]
    def new 
    end 
    
    def create 
        @user = User.find_by(username: params[:username])
        if !@user.nil?
            redirect_to "/" unless @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect_to "/home/#{@user.id}"
        else 
            flash[:message] = "Incorrect email or password"
            redirect_to "/"
        end 
    end 

    def destroy 
        session.delete(:user_id)
        redirect_to "/"
    end 
end 