class SessionsController < ApplicationController

    def new

    end

    def create
      user = User.find_by(user_name: params[:session][:user_name])
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to songs_path(user)
      else
        flash[:errors] = "Invalid login, brah"
        render :new
      end
    end

    def destroy
      session[:user_id] = nil
      flash[:bye] = "Later, brah"
      redirect_to login_path
    end

end
