class SessionsController < ApplicationController
    skip_before_action :require_login
  
    def landing
      redirect_to '/main'
    end
  
    def index
    end
    
    def login
      @user = User.find_by(email: params['email'], password: params['password'])
      if @user
        puts @user.id
      end
      if @user
        session[:user_id] = @user.id
        redirect_to '/songs'
      else
        flash[:errors] =["Invalid combination"]
        redirect_to :back
      end
    end
  
    def logout
      reset_session
      redirect_to '/'
    end
end
  