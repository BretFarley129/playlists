class UsersController < ApplicationController
    skip_before_filter :require_login, :only => [:create]
  
    def create
      @user = User.new(user_params)
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to '/songs'
      else
        flash[:errors] = @user.errors
        redirect_to :back
      end
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end   
  